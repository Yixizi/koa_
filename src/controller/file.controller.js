const fileService = require('../service/file.service');
const userService = require('../service/user.service');
const { SERVER_HOST, SERVER_PORT } = require('../config/server');

class FileController {
  async create(ctx, next) {
    console.log(ctx.request.file);
    // console.log(ctx.request.files);
    const { filename, mimetype, size } = ctx.request.file;
    const { id } = ctx.user;
    const result = await fileService.create(filename, mimetype, size, id);

    const avatarUrl = `${SERVER_HOST}:${SERVER_PORT}/users/avatar/${id}`;

    const result2 = await userService.updateUserAvatar(avatarUrl, id);
    ctx.body = {
      code: 0,
      message: '添加图片成功',
      data: avatarUrl,
    };
  }
}

module.exports = new FileController();
