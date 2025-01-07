const momentService = require("../service/moment.service");

class MomentController {
  async create(ctx, next) {
    const { content } = ctx.request.body;

    const { id } = ctx.user;
    const result = await momentService.create(content, id);
    ctx.body = {
      code: 0,
      message: "创建用户动态成功~",
      data: result,
    };
  }

  async list(ctx, next) {
    const { offset = 0, size = 10 } = ctx.query;

    const result = await momentService.queryList(offset, size);

    ctx.body = {
      code: 0,
      data: result,
    };
  }

  async detail(ctx, next) {
    const { momentId } = ctx.params;
    const result = await momentService.queryById(momentId);

    ctx.body = {
      code: 0,
      data: result[0],
    };
  }

  async update(ctx, next) {
    const { momentId } = ctx.params;
    const { content } = ctx.request.body;
    const result = await momentService.update(momentId, content);
    ctx.body = {
      code: 0,
      data: result,
      message: "修改成功",
    };
  }
}

module.exports = new MomentController();
