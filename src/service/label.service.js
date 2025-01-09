const connection = require('../app/database');

class LabelService {
  async create(name) {
    const statement = 'INSERT INTO label (name) values (?);';
    const [result] = await connection.execute(statement, [name]);

    return result;
  }

  async find(name) {
    const statement = 'SELECT * FROM label WHERE name=?;';
    const [result] = await connection.execute(statement, [name]);

    return result[0];
  }

  async list(offset, size) {
    console.log(offset, size);
    const statement = `
      SELECT l.id id,l.name name FROM label l LIMIT ? OFFSET ? ;
    `;
    try {
      const [result] = await connection.execute(statement, [
        String(size),
        String(offset),
      ]);
      return result;
    } catch (error) {
      console.log(error);
    }
  }
}

module.exports = new LabelService();
