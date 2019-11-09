class Comment < ApplicationRecord
  has_many :comment_likes, dependent: :destroy
  belongs_to :exhibition

  def comment_likes_count
    self.comment_likes.count
  end


end
