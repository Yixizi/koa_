const connection = require('../app/database');

class FileService {
  async create(filename, mimetype, size, userId) {
    const statement =
      'INSERT INTO avatar (filename,mimetype,size,user_id) values (?,?,?,?);';
    const [result] = await connection.execute(statement, [
      filename,
      mimetype,
      size,
      userId,
    ]);

    return result;
  }

  async queryAvatarWithUserId(userId) {
    const statement = `SELECT * FROM avatar WHERE user_id =?;`;
    const [result] = await connection.execute(statement, [userId]);

    return result[result.length - 1];
  }
}

module.exports = new FileService();
