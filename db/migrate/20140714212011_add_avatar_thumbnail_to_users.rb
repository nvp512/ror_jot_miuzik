class AddAvatarThumbnailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar_thumbnail, :string
  end
end
