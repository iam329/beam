class StaticPagesController < ApplicationController
  def home
     if signed_in?
         @feed_items_user = current_user.feed
         @latestpost_user = @feed_items_user.first
         @count_user = @feed_items_user.count

     end

     @feed_items_all = Post.all.limit(200)
     @latestpost_all = @feed_items_all.first
     @count_all = @feed_items_all.count

  end

  def trending
    if signed_in?
      @feed_items = Post.all.limit(200)  
      @latestpost = @feed_items.first
      @count = Post.count
    else     
      redirect_to root_path
    end
  end

  def about
  end

  def help
  end
end