class UsersController < ApplicationController

	def new
		@title = "Signup"
		@user = User.new
	end

	def create

		@user = User.new(params[:user])
		if @user.save
			#gravar user
		else
			@title = "Signup"
			render 'new'
		end
	end
end
