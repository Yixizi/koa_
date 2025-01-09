const { UPLOAD_PATH } = require('../config/path');
const fileService = require('../service/file.service');
const userService = require('../service/user.service');
const fs = require('fs');

class UserController {
  async create(ctx, next) {
    const user = ctx.request.body;

    ////

    const result = await userService.create(user);

    ctx.body = {
      message: '创建成功',
      data: result,
    };
  }

  async showAvatarImage(ctx, next) {
    const { userId } = ctx.params;
    const avatarInfo = await fileService.queryAvatarWithUserId(userId);

    if (!avatarInfo) {
      // 如果没有头像信息，可以返回404或其他提示信息
      ctx.status = 404;
      ctx.body = { message: '头像未找到' };
      return;
    }

    const { filename, mimetype } = avatarInfo;
    ctx.type = mimetype;

    const filePath = `${UPLOAD_PATH}/${filename}`;

    try {
      // 检查文件是否存在
      await fs.promises.access(filePath); // 如果文件存在，不会抛出异常

      // 设置响应头和响应体
      ctx.type = mimetype;
      ctx.body = fs.createReadStream(filePath); // 读取文件流返回给客户端
    } catch (err) {
      // 如果文件不存在，则返回404或其他错误信息
      console.log(err);
      ctx.status = 404;
      ctx.body = { message: '文件未找到' };
    }

    ctx.body = fs.createReadStream(`${UPLOAD_PATH}/${filename}`);
  }
}

module.exports = new UserController();
