class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@title = @user.username
		@tracks = Track.find_all_by_user_id(params[:id])
	end

	def new
		@title = "Signup"
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:success] = "Welcome, #{@user.username}!"
			redirect_to @user
		else
			@title = "Signup"
			flash.now[:error] = "Please correct your information!"
			render "new"
		end
	end
end
