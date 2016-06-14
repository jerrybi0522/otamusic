class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :name
      t.string :artist
      t.text :description
      t.string :youtube_url

      t.timestamps null: false
    end
  end
end
