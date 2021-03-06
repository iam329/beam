class PostsController < ApplicationController

	before_action :signed_in_user, only: [:new, :create, :destroy]

	def index
	end

	def new
		@post = current_user.posts.new
	end

	def create
		@post = current_user.posts.build(post_params)

		if @post.save
			redirect_to profile_path(current_user.name)
		else
			render 'new'
		end
	end

	def destroy
		Post.find(params[:id]).destroy
    	redirect_to profile_path(current_user.name)
	end

	private

	def post_params
		params.require(:post).permit(:title, 
	  								 :artist, 
	  								 :link,
	  								 :blurb) 
	end

end
