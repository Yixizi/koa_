const connection = require('../app/database');

class CommentService {
  async create(content, momentId, userId) {
    const statement =
      'INSERT INTO comment (content,moment_id,user_id) VALUES (?,?,?);';
    const [result] = await connection.execute(statement, [
      content,
      momentId,
      userId,
    ]);

    return result;
  }

  async reply(content, momentId, commentId, userId) {
    console.log('asdad');
    const statement =
      'INSERT INTO comment (content,moment_id,comment_id,user_id) VALUES (?,?,?,?);';
    const [result] = await connection.execute(statement, [
      content,
      momentId,
      commentId,
      userId,
    ]);

    return result;
  }

  async remove(commentId) {
    const statement = 'DELETE FROM comment WHERE id=?;';
    const [result] = await connection.execute(statement, [commentId]);

    return result;
  }

  async find(commentId) {
    console.log(commentId);
    const statement = `
  SELECT
    comment.id id ,
    comment.content content,
    comment.createAt createTime ,
    comment.updateAt updateTime ,
    JSON_OBJECT('id', u.id, 'name', u.name, 'createTime', u.createAt, 'updateTime', u.updateAt) AS user ,
    JSON_OBJECT('id', m.id, 'content', m.content, 'createTime', m.createAt, 'updateTime', m.updateAt) AS moment 
  FROM
    comment 
  LEFT JOIN 
    user u ON comment.user_id = u.id
  LEFT JOIN
    moment m ON comment.moment_id = m.id 
  WHERE
    comment.id = ?;
    `;
    const [result] = await connection.execute(statement, [String(commentId)]);

    return result;
  }
}

module.exports = new CommentService();
