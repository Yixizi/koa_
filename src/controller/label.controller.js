const labelService = require('../service/label.service');

class LabelController {
  async create(ctx, next) {
    const { labels } = ctx.request.body;

    // const result = await labelService.create(name);
    const resultList = [];
    for (const name of labels) {
      const result = await find(name);

      const labelObj = { name };
      if (result) {
        labelObj.id = result.id;
      } else {
        const insertResult = await labelService.create(name);
        labelObj.id = insertResult.insertId;
      }
      resultList.push(labelObj);
    }

    ctx.body = {
      msg: '设置标签成功',
      code: 0,
      data: resultList,
    };
  }

  async list(ctx, next) {
    const { offset = 0, size = 10 } = ctx.request.body;

    const result = await labelService.list(offset, size);

    ctx.body = {
      msg: '获取标签列表成功',
      code: 0,
      data: result,
    };
  }
}

module.exports = new LabelController();
