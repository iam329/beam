class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :artist
      t.string :blurb
      t.string :youtube
      t.string :soundcloud

      t.timestamps
    end
  end
end
