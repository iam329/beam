class RenameYoutubeColumnInPosts < ActiveRecord::Migration
  def change
  	rename_column :posts, :youtube, :link
  end
end
