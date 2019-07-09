class Exhibition < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  def likes_count
    self.likes.count
  end

  def self.filter(*args)
      args = args.first.select {|k, v| v != ""}
      Exhibition.all.find_by(args)
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
