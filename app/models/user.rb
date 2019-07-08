class User < ApplicationRecord
    has_many :likes
    has_many :exhibitions
    has_many :liked_exhibitions, through: :likes, source: :exhibition
    has_many :comment_likes
    has_many :comments, through: :comment_likes
    has_secure_password
    validates :first_name, :last_name, :user_name, :password, presence: true
    validates :first_name, :last_name, :user_name, uniqueness: true

    def full_name
        "#{self.first_name} #{self.last_name}"
    end
end
