const { LABEL_NAME_IS_ALREADY_EXISTS } = require('../config/error');
const labelService = require('../service/label.service');
const { find } = require('../service/label.service');

const verifyLabelNameList = async (ctx, next) => {
  const { labels } = ctx.request.body;

  const newLabels = [];
  for (const name of labels) {
    const result = await find(name);

    const labelObj = { name };

    if (result) {
      labelObj.id = result.id;
    } else {
      const insertResult = await labelService.create(name);
      labelObj.id = insertResult.insertId;
    }

    newLabels.push(labelObj);
  }
  console.log(newLabels);

  ctx.labels = newLabels;

  // const result = await find(name);

  // if (result) return ctx.app.emit('error', LABEL_NAME_IS_ALREADY_EXISTS, ctx);
  await next();
};

// const verifyLabelName = async (ctx, next) => {
//   const { labels } = ctx.request.body;
// };

module.exports = {
  verifyLabelNameList,
};
