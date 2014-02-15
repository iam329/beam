class AddAttachmentWallpaperToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :wallpaper
    end
  end

  def self.down
    drop_attached_file :users, :wallpaper
  end
end
