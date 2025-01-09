const KoaRouter = require('@koa/router');
const { verifyAuth } = require('../middleware/login.middleware');
const { create } = require('../controller/label.controller');
const { verifyLabelNameList } = require('../middleware/label.middleware');
const { list } = require('../service/label.service');
const labelController = require('../controller/label.controller');

const labelRouter = new KoaRouter({
  prefix: '/label',
});

labelRouter.post('/', verifyAuth, create);
labelRouter.get('/', verifyAuth, labelController.list);

module.exports = labelRouter;
