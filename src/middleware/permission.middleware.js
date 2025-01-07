const { OPERATION_IS_NOT_ALLOWED } = require("../config/error");
const permissionService = require("../service/permission.service");

const verifyMomentPermission = async (ctx, next) => {
  const { id } = ctx.user;
  const { momentId } = ctx.params;

  const isPermission = await permissionService.checkMoment(momentId, id);
  console.log(id, momentId, isPermission);
  if (!isPermission) {
    return ctx.app.emit("error", OPERATION_IS_NOT_ALLOWED, ctx);
  }

  await next();
};

module.exports = {
  verifyMomentPermission,
};
