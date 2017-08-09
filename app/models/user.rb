class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include Gravtastic
  gravtastic
  has_many :microposts, dependent: :destroy
  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.search(search)
    if search
      where("name like ?", "%#{search}%")
    else
      all
    end
  end

  def self.all_except(user)
    where.not(id: user)
  end

  # Follows a user.
def follow(other_user)
  following << other_user
end

# Unfollows a user.
def unfollow(other_user)
  following.delete(other_user)
end

# Returns true if the current user is following the other user.
def following?(other_user)
  following.include?(other_user)
end
end
