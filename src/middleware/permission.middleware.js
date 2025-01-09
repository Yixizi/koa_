const { OPERATION_IS_NOT_ALLOWED } = require('../config/error');
const permissionService = require('../service/permission.service');

const verifyPermission = async (ctx, next) => {
  const { id } = ctx.user;
  const keyName = Object.keys(ctx.params)[0];
  const resourceId = ctx.params[keyName];
  const resourceName = keyName.replace('Id', '');

  const isPermission = await permissionService.checkMoment(
    resourceName,
    resourceId,
    id,
  );
  // console.log(id, keyName, resourceId, resourceName, isPermission);
  if (!isPermission) {
    return ctx.app.emit('error', OPERATION_IS_NOT_ALLOWED, ctx);
  }

  await next();
};

module.exports = {
  verifyPermission,
};
