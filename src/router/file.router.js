const KoaRouter = require('@koa/router');
const multer = require('@koa/multer');
const { verifyAuth } = require('../middleware/login.middleware');
const {
  handleAvatar,
  handleDiskSingle,
} = require('../middleware/file.middleware');
const { create } = require('../controller/file.controller');

const fileRouter = new KoaRouter({
  prefix: '/file',
});

fileRouter.post('/avatar', verifyAuth, handleDiskSingle, create);

module.exports = fileRouter;
