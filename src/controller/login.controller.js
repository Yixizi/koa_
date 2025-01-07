const jwt = require("jsonwebtoken");
const { PRIVATE_KEY } = require("../config/secret");

class LoginController {
  sign(ctx, next) {
    const { id, name } = ctx.user;

    const token = jwt.sign(
      {
        id,
        name,
      },
      PRIVATE_KEY,
      {
        expiresIn: 24 * 60 * 60,
        algorithm: "RS256",
      },
    );

    ctx.body = {
      code: 0,
      data: {
        token,
        id,
        name,
      },
    };
  }

  //测试登入
  test(ctx, nest) {
    ctx.body = "可以login/test接口";
  }
}

module.exports = new LoginController();
