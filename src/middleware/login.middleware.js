const {
  NAME_OR_PASSWORD_IS_REQUIRED,
  NAME_IS_NOT_EXISTS,
  PASSWORD_IS_INCORRECT,
  UNAUTHORIZATION,
} = require('../config/error');
const jwt = require('jsonwebtoken');
const md5password = require('../utils/md5-password');
const userService = require('../service/user.service');
const { PUBLIC_KEY } = require('../config/secret');

const verifyLogin = async (ctx, next) => {
  const { name, password } = ctx.request.body;

  if (!name || !password) {
    return ctx.app.emit('error', NAME_OR_PASSWORD_IS_REQUIRED, ctx);
  }

  const users = await userService.findUserByName(name);
  const user = users[0];
  if (!user) {
    return ctx.app.emit('error', NAME_IS_NOT_EXISTS, ctx);
  }

  if (user.password !== md5password(password)) {
    return ctx.app.emit('error', PASSWORD_IS_INCORRECT, ctx);
  }

  ctx.user = user;

  await next();
};

const verifyAuth = async (ctx, next) => {
  const authorization = ctx.headers.authorization;
  if (!authorization) return ctx.app.emit('error', UNAUTHORIZATION, ctx);

  const token = authorization.replace('Bearer ', '');

  try {
    const result = jwt.verify(token, PUBLIC_KEY, {
      algorithms: ['RS256'],
    });
    ctx.user = result;
    await next();
  } catch (err) {
    console.log(err);
    ctx.app.emit('error', UNAUTHORIZATION, ctx);
  }
};

module.exports = {
  verifyLogin,
  verifyAuth,
};
