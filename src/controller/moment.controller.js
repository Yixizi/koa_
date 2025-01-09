const momentService = require('../service/moment.service');

class MomentController {
  async create(ctx, next) {
    const { content } = ctx.request.body;

    const { id } = ctx.user;
    const result = await momentService.create(content, id);
    ctx.body = {
      code: 0,
      message: '创建用户动态成功~',
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
      message: '查询成功',
      data: result,
    };
  }

  async update(ctx, next) {
    const { momentId } = ctx.params;
    const { content } = ctx.request.body;
    const result = await momentService.update(momentId, content);
    ctx.body = {
      code: 0,
      data: result,
      message: '修改成功',
    };
  }

  async remove(ctx, next) {
    const { momentId } = ctx.params;
    const { content } = ctx.request.body;
    const result = await momentService.remove(momentId, content);
    ctx.body = {
      code: 0,
      data: result,
      message: '删除成功',
    };
  }

  async addLabels(ctx, next) {
    const labels = ctx.labels;
    const { momentId } = ctx.params;
    try {
      for (const label of labels) {
        const isExists = await momentService.hasLabel(momentId, label.id);

        if (!isExists) {
          const result = await momentService.addLabel(momentId, label.id);
        }
      }

      ctx.body = {
        code: 0,
        message: '添加动态标签成功',
      };
    } catch (error) {
      console.log(error);
      ctx.body = {
        code: -3001,
        message: '添加动态标签失败',
      };
    }
  }
}

module.exports = new MomentController();
