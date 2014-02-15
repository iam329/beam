class StaticPagesController < ApplicationController
  def home
  	if signed_in?
  		@feed_items = current_user.feed
  	end
  end

  def about
  end

  def help
  end
end
