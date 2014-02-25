class StaticPagesController < ApplicationController
  def home
     if signed_in?
         @feed_items_user = current_user.feed
         @latestpost_user = @feed_items_user.first
         @count_user = @feed_items_user.count

     end

     @feed_items_all = Post.all
     @latestpost_all = @feed_items_all.first
     @count_all = @feed_items_all.count

  end

  def about
  end

  def help
  end
end