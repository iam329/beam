class LikesController < ApplicationController
  
  before_action :signed_in_user

  def create
  	@post = Post.find(params[:like][:post_id])
  	current_user.like!(@post)
  	respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  def destroy
  	@post = Like.find(params[:id]).post
  	current_user.unlike!(@post)
  	respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

end
