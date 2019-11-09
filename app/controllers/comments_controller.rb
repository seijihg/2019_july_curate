class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
    # @exhibition = Exhibition.find(params[:id])
  end

  def create
    comment = Comment.create(comment_params)
    redirect_to exhibition_path(comment.exhibition.id)
  end

  def edit
    @comment = Comment.find(params[:id])
    @exhibition = @comment.exhibition
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to exhibition_path(@comment.exhibition)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to exhibition_path(@comment.exhibition)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :exhibition_id, :user_comment)
  end


end
