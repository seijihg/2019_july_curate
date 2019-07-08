class Exhibition < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  def self.most_likes
    Exhibition.all.sort { |exhibition| exhibition.likes.count}.reverse
  end

  def likes_count
    self.likes.count
  end
end
