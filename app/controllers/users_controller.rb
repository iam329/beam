class UsersController < ApplicationController
	before_action :signed_in_user, only:[:edit, :update]
	before_action :correct_user, only:[:edit, :update]

	def show
		if params[:name]
			@user=User.where(name:params[:name])
		else
			redirect_to root_path
		end
	end

	def new
	  	@user=User.new		
	end

	def create
		@user=User.new(user_params)

		if @user.save
			sign_in @user
			flash[:success] = "Welcome to TapeDeckHero! What's your track of the day?"
			redirect_to @user
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
      		flash[:success] = "Profile Updated"
      		redirect_to user_show_path(@user.name)
    	else
      		render 'edit'
    	end
  	end

	def destroy
	end

	private

	def user_params
	  	params.require(:user).permit(:name, 
	  								 :email, 
	  								 :bio, 
	  								 :password,
                                     :password_confirmation)	
	end

	def correct_user
		@user = User.find(params[:id])
		unless current_user == @user
			redirect_to root_path
		end
	end 

end
