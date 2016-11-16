class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :username, format: { with: /\A[a-zA-Z0-9]+\z/, message: "only allows letters and numbers"}
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  belongs_to :song
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :create_permalink

  mount_uploader :avatar, AvatarUploader

  def to_param
    permalink
  end

  def all_friends
    friends + inverse_friends
  end

  def all_friendships
    friendships + inverse_friendships
  end

  private
    def create_permalink
      self.permalink = username
    end
end
