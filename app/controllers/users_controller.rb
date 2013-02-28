class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@title = @user.username
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
			flash.now[:error] = "Your signup has errors!"
			render "new"
		end
	end
end
