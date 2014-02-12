class PostsController < ApplicationController

	before_action :signed_in_user, only: [:create, :destroy]

	def index
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

end
