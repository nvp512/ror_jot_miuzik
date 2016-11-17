class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: "User"

  validates :user_id, :friend_id, presence: true
  validate :uniquiness_of_friendship

  def uniquiness_of_friendship

    unless Friendship.where(user_id: self.user_id, friend_id: self.friend_id).empty? &&
        Friendship.where(user_id: self.friend_id, friend_id: self.user_id).empty?

      errors[:base] << ("Friendship already exists")
    end
  end
end
