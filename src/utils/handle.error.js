const app = require('../app');
const {
  NAME_OR_PASSWORD_IS_REQUIRED,
  NAME_IS_ALREADY_EXISTS,
  NAME_IS_NOT_EXISTS,
  PASSWORD_IS_INCORRECT,
  UNAUTHORIZATION,
  OPERATION_IS_NOT_ALLOWED,
  LABEL_NAME_IS_ALREADY_EXISTS,
} = require('../config/error');

app.on('error', (error, ctx) => {
  let code = 0;
  let message = '';

  switch (error) {
    case NAME_OR_PASSWORD_IS_REQUIRED:
      (code = -1001), (message = '用户名或者密码不能为空');
      break;
    case NAME_IS_ALREADY_EXISTS:
      (code = -1002), (message = '用户名已经存在');
      break;
    case NAME_IS_NOT_EXISTS:
      (code = -1003), (message = '用户名不存在');
      break;
    case PASSWORD_IS_INCORRECT:
      (code = -1004), (message = '密码错误');
      break;
    case UNAUTHORIZATION:
      (code = -1005), (message = '无效的token或者token已过期');
      break;
    case OPERATION_IS_NOT_ALLOWED:
      (code = -1006), (message = '无法操作他人的动态');
      break;
    case LABEL_NAME_IS_ALREADY_EXISTS:
      (code = -1007), (message = '标签名已经存在');
      break;
  }

  ctx.body = {
    code,
    message,
  };
});
