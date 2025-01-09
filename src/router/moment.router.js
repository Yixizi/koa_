const KoaRouter = require('@koa/router');
const { verifyAuth } = require('../middleware/login.middleware');
const momentController = require('../controller/moment.controller');
const { verifyPermission } = require('../middleware/permission.middleware');
const { verifyLabelNameList } = require('../middleware/label.middleware');

const momentRouter = new KoaRouter({
  prefix: '/moment',
});

//增
momentRouter.post('/', verifyAuth, momentController.create);
//查
momentRouter.get('/', momentController.list);
momentRouter.get('/:momentId', momentController.detail);
//删

momentRouter.delete(
  '/:momentId',
  verifyAuth,
  verifyPermission,
  momentController.remove,
);
//改
momentRouter.patch(
  '/:momentId',
  verifyAuth,
  verifyPermission,
  momentController.update,
);

//添加动态的标签

momentRouter.post(
  '/:momentId/labels',
  verifyAuth,
  verifyPermission,
  verifyLabelNameList,
  momentController.addLabels,
);
module.exports = momentRouter;
