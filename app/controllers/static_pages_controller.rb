class StaticPagesController < ApplicationController
  def home
     if signed_in?
         @feed_items_user = current_user.feed
         @latestpost_user = @feed_items_user.first
         @count_user = @feed_items_user.count

     end

     @feed_items_all = Post.where(user_id: [1,2,3,4,5,6,7,8,9,10])
     @latestpost_all = @feed_items_all.first
     @count_all = @feed_items_all.count

  end

  def about
  end

  def help
  end
end