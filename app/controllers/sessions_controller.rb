class SessionsController < ApplicationController
	before_filter :already_signed, only:[:new, :create]

	def new
		@title = "Signin"
	end

	def create
		@title = "Signin"
		user = User.find_by_email(params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			if params[:remember_me]
				sign_in_and_remember user
			else
				sign_in user
			end
			flash[:success] = "Welcome, #{user.name}"
			redirect_to user #session[:return_to] || profile_path
		else
			flash.now[:error] = "Invalid email/password combination"
			render 'new'
		end
	end

	def destroy
		sign_out
		#flash[:info] = "You have successfully logged out"
		redirect_to root_path
	end

	private

		def already_signed
			if signed_in?
         	#flash[:info] = "Already signed in!"
        		redirect_to root_path
		   end
		end
end
