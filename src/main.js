const { SERVER_PORT } = require('./config/server');
const app = require('./app/index');
require('./utils/handle.error');

console.log(SERVER_PORT);
app.listen(SERVER_PORT, () => {
  console.log('cleverCode的服务启动成功');
});
