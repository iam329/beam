class Post < ActiveRecord::Base

	belongs_to :user
	
	default_scope -> { order('created_at DESC') }
	
	validates :user_id, presence: true
	validates :title, presence: true
	validates :artist, presence: true
	validates :blurb, length: { maximum: 140 }
	validates :link, presence: true

	# Returns microposts from the users being followed by the given user.
	def self.from_users_followed_by(user)
		followed_user_ids = "SELECT followed_id FROM relationships
		                     WHERE follower_id = :user_id"
		where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
		      user_id: user.id)
	end

	def yt?
  		self.link.start_with?("youtube.com") || self.link.start_with?("m.youtube.com") || self.link.start_with?("www.youtube.com") || self.link.start_with?("http://www.youtube.com")  || self.link.start_with?("http://youtu.be") || self.link.start_with?("http://m.youtube")
  	end

	def ytcode
    	self.link[/(?<=[?&]v=)[^&$]+/]
  	end
end
