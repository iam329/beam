class LikesController < ApplicationController
  
  before_action :signed_in_user

  def create
  	@nowplaying = Post.find(params[:like][:post_id])
  	current_user.like!(@nowplaying)
  	respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
    if current_user != @nowplaying.user
      UserMailer.liker(current_user, @nowplaying, @nowplaying.user).deliver
    end
  end

  def destroy
  	@nowplaying = Like.find(params[:id]).post
  	current_user.unlike!(@nowplaying)
  	respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
end
