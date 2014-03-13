class RelationshipsController < ApplicationController
  
	before_action :signed_in_user 

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    respond_to do |format|
      format.html { redirect_to profile_path(@user.name) }
      format.js
    end
    UserMailer.delay.follower(current_user, @user).deliver
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_to do |format|
      format.html { redirect_to profile_path(@user.name) }
      format.js
    end
  end
end
