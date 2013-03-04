class UsersController < ApplicationController
	before_filter :authorize, only: [:show, :edit, :update]
	before_filter :already_signed, only:[:new, :create]

	def show
		@user = !params[:id].nil? ? User.find(params[:id]) : current_user
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
			sign_in @user
			flash[:success] = "Welcome, #{@user.username}!"
			redirect_to @user
		else
			@title = "Signup"
			flash.now[:error] = "Please correct your information!"
			render "new"
		end
	end

	private

		def authorize
	      if !signed_in?
	        store_location
	        flash[:info] = "Authentication is needed to view this page"
	        redirect_to signin_path
	      end
	    end

		def already_signed
			if signed_in?
         	#flash[:info] = "You are already logged in. Sign out and try again"
        		redirect_to root_path
		   end
		end
end
