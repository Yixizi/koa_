const commentService = require('../service/comment.service');

class CommentController {
  async create(ctx, next) {
    const { content, momentId } = ctx.request.body;
    const { id } = ctx.user;
    console.log(content, momentId, id);

    const result = await commentService.create(content, momentId, id);

    ctx.body = { message: '发表评论成功', code: 0, data: result };
  }

  async reply(ctx, next) {
    const { content, momentId, commentId } = ctx.request.body;
    const { id } = ctx.user;

    const result = await commentService.reply(content, momentId, commentId, id);

    ctx.body = { message: '回复评论成功', code: 0, data: result };
  }

  async remove(ctx, next) {
    const { commentId } = ctx.request.body;
    const { id } = ctx.user;

    const result = await commentService.remove(commentId);

    ctx.body = { message: '删除评论成功', code: 0, data: result };
  }

  async find(ctx, next) {
    const { commentId } = ctx.params;

    const result = await commentService.find(commentId);

    ctx.body = { message: '获取评论成功', code: 0, data: result };
  }
}

module.exports = new CommentController();
