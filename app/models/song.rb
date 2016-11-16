class Song < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :added_by, :song_uri, :song_name, presence: true
  validates :song_name, uniqueness: { scope: :user_id,
  message: "song already on playlist!" }
end
