const connection = require('../app/database');

class MomentService {
  async create(content, userId) {
    const statement = 'INSERT INTO moment (content,user_id) VALUES (?,?);';
    const [result] = await connection.execute(statement, [content, userId]);

    return result;
  }

  async queryList(offset, size) {
    const statement = `
    SELECT
      m.id id,
      m.content content,
      m.createAt createTime,
      m.updateAt updateTime,
      JSON_OBJECT('id', u.id, 'name', u.name,'avatarURL',u.avatar_url,'createTime', u.createAt, 'updateTime', u.updateAt) AS user,
      (SELECT COUNT(*) FROM comment WHERE comment.moment_id=m.id) commentCount,
      (SELECT COUNT(*) FROM moment_label ml WHERE ml.moment_id=m.id) labelCount
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
    console.log(momentId, 12313414);
    const statement = `
 SELECT
  m.id id,
  m.content content,
  m.createAt createTime,
  m.updateAt updateTime,
  JSON_OBJECT('id', u.id, 'name', u.NAME, 'avatarURL',u.avatar_url,'createTime', u.createAt, 'updateTime', u.updateAt) user,
  (SELECT COUNT(*) FROM COMMENT WHERE COMMENT.moment_id = m.id) commentCount,
  (SELECT COUNT(*) FROM moment_label ml WHERE ml.moment_id = m.id) labelCount,
  (SELECT 
    JSON_ARRAYAGG(
      JSON_OBJECT(
        'id',
        c.id,
        'content',
        c.content,
        'comment_id',
        c.comment_id,
        'user',JSON_OBJECT('id',cu.id,'name',cu.name,'avatarURL',u.avatar_url)
 ))
  FROM comment c LEFT JOIN user cu on c.user_id=cu.id WHERE m.id=c.moment_id ) comments,
  (
    JSON_ARRAYAGG(
      JSON_OBJECT(
        'id',
        l.id,
        'name',
        l.name
 ))) labels 
FROM
  moment m
  LEFT JOIN USER u ON m.user_id = u.id
  LEFT JOIN moment_label ml ON ml.moment_id = m.id
  LEFT JOIN label l ON ml.label_id = l.id 
WHERE
  m.id = ?
GROUP BY
  m.id;
`;

    const [result] = await connection.execute(statement, [momentId]);

    return result;
  }

  async update(momentId, content) {
    const statement = `UPDATE moment SET content = ? WHERE id = ?;`;

    const [result] = await connection.execute(statement, [content, momentId]);

    return result;
  }

  async remove(momentId) {
    const statement = `DELETE FROM moment WHERE id = ?;`;

    const [result] = await connection.execute(statement, [momentId]);

    return result;
  }

  async hasLabel(momentId, labelId) {
    const statement = `SELECT * FROM moment_label WHERE moment_id =? AND label_id =?`;
    const [result] = await connection.execute(statement, [momentId, labelId]);

    return !!result.length;
  }

  async addLabel(momentId, labelId) {
    const statement = `INSERT INTO moment_label (moment_id,label_id) values (?,?)`;
    const [result] = await connection.execute(statement, [momentId, labelId]);

    return result;
  }
}

module.exports = new MomentService();
