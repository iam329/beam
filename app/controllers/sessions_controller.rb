class SessionsController < ApplicationController
  def new

  end

  def create
  	user=User.find_by_email(params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		sign_in user
        redirect_back_or root_path
  	else
  		flash.now[:error] = 'Yikes ... Looks like you entered an invalid email/password combination'
  		render 'new'
  	end	
  end

  def destroy
  	sign_out
  	redirect_to root_path
  end
end
