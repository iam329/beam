class StaticPagesController < ApplicationController
  def home
  	if signed_in?
  		@feed_items = current_user.feed
  		@latestpost = @feed_items.first
  		@count = @feed_items.count
  	end
  end

  def about
  end

  def help
  end
end
