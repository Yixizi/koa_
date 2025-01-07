const KoaRouter = require("@koa/router");
const { verifyAuth } = require("../middleware/login.middleware");
const momentController = require("../controller/moment.controller");
const {
  verifyMomentPermission,
} = require("../middleware/permission.middleware");

const momentRouter = new KoaRouter({
  prefix: "/moment",
});

//增
momentRouter.post("/", verifyAuth, momentController.create);
//查
momentRouter.get("/", momentController.list);
momentRouter.get("/:momentId", momentController.detail);
//删

//改
momentRouter.patch(
  "/:momentId",
  verifyAuth,
  verifyMomentPermission,
  momentController.update,
);

module.exports = momentRouter;
