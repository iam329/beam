class UsersController < ApplicationController
    before_action :signed_in_user, only:[:edit, :update]
    before_action :correct_user, only:[:edit, :update]

    def show
       @user = User.find_by_name(params[:name])

       if @user
          @posts = @user.posts
          @latestpost = @posts.first
          @count = @posts.count
       else
          redirect_to root_path
       end
    end

    def new
       @user = User.new
    end

    def create
       @user=User.new(user_params)

       if @user.save
           sign_in @user
           redirect_to profile_path(@user.name)
       else
           render 'new'
       end
    end

    def edit
       @user=User.find(params[:id])
    end

    def update
       @user = User.find(params[:id])

       if @user.update_attributes(user_params)
           redirect_to profile_path(@user.name)
       else
           render 'edit'
       end
    end

    def destroy
    end

    def index
       @users = User.all
       @user = current_user
    end

    def following
       @user = User.find(params[:id])
       @users = @user.followed_users
       @count = @user.posts.count
       render 'show_following'
    end

    def followers
       @user = User.find(params[:id])
       @users = @user.followers
       @count = @user.posts.count
       render 'show_follower'
    end

    private

       def user_params
           params.require(:user).permit(:name,
                                        :email,
                                        :bio,
                                        :password,
                                        :password_confirmation,
                                        :photo,
                                        :wallpaper)
       end

       def correct_user
           @user = User.find(params[:id])
           unless current_user == @user
           redirect_to root_path
       end
    end
end
