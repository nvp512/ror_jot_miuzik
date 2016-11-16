class Songs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :user_id
      t.string :added_by
      t.string :song_uri
      t.string :song_name
      t.timestamps
    end
  end
end
