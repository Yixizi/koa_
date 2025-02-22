const Koa = require("koa");
const bodyParser = require("koa-bodyparser");
const userRouter = require("../router/user.router");
const loginRouter = require("../router/login.router");
const registerRouters = require("../router");

const app = new Koa();

app.use(bodyParser());

registerRouters(app);
// app.use(userRouter.routes());
// app.use(userRouter.allowedMethods());
// app.use(loginRouter.routes());
// app.use(loginRouter.allowedMethods());

module.exports = app;
