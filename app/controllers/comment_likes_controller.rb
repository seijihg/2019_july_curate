class CommentLikesController < ApplicationController

  def create
    comment_like = CommentLike.create(comment_like_params)
    redirect_to exhibition_path(comment_like.comment.exhibition.id)
  end

  private

  def comment_like_params
    params.require(:comment_like).permit(:comment_id, :user_id)
  end

end
