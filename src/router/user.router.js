const KoaRouter = require('@koa/router');
const UserController = require('../controller/user.controller');
const { verifyUser, handlePassword } = require('../middleware/user.middleware');

const userRouter = new KoaRouter({ prefix: '/users' });

userRouter.post('/', verifyUser, handlePassword, UserController.create);

userRouter.get('/avatar/:userId', UserController.showAvatarImage);

module.exports = userRouter;
