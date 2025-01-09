const KoaRouter = require('@koa/router');
const { verifyAuth } = require('../middleware/login.middleware');
const { create, reply } = require('../controller/comment.controller');
const commentController = require('../controller/comment.controller');
const { verifyPermission } = require('../middleware/permission.middleware');

const commentRouter = new KoaRouter({
  prefix: '/comment',
});

//评论
commentRouter.post('/', verifyAuth, create);
//回复
commentRouter.post('/reply', verifyAuth, reply);
// 删除
commentRouter.delete(
  '/:commentId',
  verifyAuth,
  verifyPermission,
  commentController.remove,
);
commentRouter.get('/:commentId', verifyAuth, commentController.find);

module.exports = commentRouter;
