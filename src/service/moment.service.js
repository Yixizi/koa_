const connection = require("../app/database");

class MomentService {
  async create(content, userId) {
    const statement = "INSERT INTO moment (content,user_id) VALUES (?,?);";
    const [result] = await connection.execute(statement, [content, userId]);
    console.log(result);

    return result;
  }

  async queryList(offset, size) {
    const statement = `
    SELECT
      m.id id,
      m.content content,
      m.createAt createTime,
      m.updateAt updateTime,
      JSON_OBJECT('id', u.id, 'name', u.name, 'createTime', u.createAt, 'updateTime', u.updateAt) AS user
    FROM 
      moment m
    LEFT JOIN USER u ON m.user_id = u.id 
    LIMIT ? OFFSET ?;
`;
    const [result] = await connection.execute(statement, [
      String(size),
      String(offset),
    ]);
    return result;
  }

  async queryById(momentId) {
    const statement = `
    SELECT
      m.id id,
      m.content content,
      m.createAt createTime,
      m.updateAt updateTime,
      JSON_OBJECT('id', u.id, 'name', u.name, 'createTime', u.createAt, 'updateTime', u.updateAt) AS user
    FROM 
      moment m
    LEFT JOIN USER u ON m.user_id = u.id 
    WHERE m.id=?;
`;

    const [result] = await connection.execute(statement, [String(momentId)]);
    return result;
  }

  async update(momentId, content) {
    console.log(12314);
    const statement = `UPDATE moment SET content = ? WHERE id = ?;`;
    console.log(112313);
    const [result] = await connection.execute(statement, [content, momentId]);

    return result;
  }
}

module.exports = new MomentService();
