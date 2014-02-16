class RemoveSoundcloudFromPosts < ActiveRecord::Migration
  def change
  	remove_column :posts, :soundcloud
  end
end
