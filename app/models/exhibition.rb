class Exhibition < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments
  validates :title, :artist, :category, :gallery, :location, :date_end, :user_id, presence: true
  validates :title, uniqueness: true

  def likes_count
    self.likes.count
  end

  def self.most_liked
    Exhibition.all.max_by {|exhibition| exhibition.likes.count}
  end

  def self.most_occurring_location
    locs = Exhibition.all.map {|exhibition| exhibition.location}
    locs.max_by { |i| locs.count(i)}
  end

  def self.exhib_count
    Exhibition.where(location: Exhibition.most_occurring_location).count
  end


  def self.total_average_likes
    all_likes = Exhibition.all.map {|exhibition| exhibition.likes.count}
    average = all_likes.sum / all_likes.size
  end

  def self.filter(*args)
      args = args.first.select {|k, v| v != ""}
      Exhibition.all.where(args)
  end

  def self.locations
    Exhibition.all.map {|loc| loc.location}
  end
  def self.galleries
    Exhibition.all.map {|gal| gal.gallery}
  end
  def self.categories
    Exhibition.all.map {|cat| cat.category}
  end
end
