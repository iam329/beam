class UsersController < ApplicationController

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
			redirect_to root_path
		else
		 	render 'new'
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

end
