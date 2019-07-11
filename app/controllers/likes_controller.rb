class LikesController < ApplicationController

  def create
    like = Like.create(like_params)
    redirect_to exhibition_path(like.exhibition_id)
  end

  def create_index
    like = Like.create(like_params)
    redirect_to '/'
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :exhibition_id)
  end

end
