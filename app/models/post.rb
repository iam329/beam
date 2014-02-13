class Post < ActiveRecord::Base

	belongs_to :user
	
	default_scope -> { order('created_at DESC') }
	
	validates :user_id, presence: true
	validates :title, presence: true
	validates :artist, presence: true
	validates :blurb, length: { maximum: 140 }

end
