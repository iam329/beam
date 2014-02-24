class StaticPagesController < ApplicationController
  def home
<<<<<<< HEAD
  	if signed_in?
  		@feed_items = current_user.feed
  		@latestpost = @feed_items.first
  		@count = @feed_items.count
=======
 	if signed_in?
  		@feed_items_user = current_user.feed
  		@latestpost_user = @feed_items_user.first
  		@count_user = @feed_items_user.count	
>>>>>>> parent of 16873ff... Updated home page for signed in and visitor mode
  	end
  end

  def about
  end

  def help
  end
end
