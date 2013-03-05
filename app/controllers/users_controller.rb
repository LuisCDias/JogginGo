class UsersController < ApplicationController
	before_filter :authorize, only: [:show, :edit, :update]
	before_filter :signed_user, only: [:edit, :update]
	before_filter :already_signed, only:[:new, :create]

	def index
		@users = User.all #substituir por paginate
	end

	def show
		@user = !params[:id].nil? ? User.find(params[:id]) : current_user
		@title = @user.username

		track = Track.find_all_by_user_id(@user.id).first
		all = Point.find_all_by_track_id(track.id)
		@first = all.first.address
        @last = all.last.address
        all.pop
        all.delete_at(0)
        @waypoints = all
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

	def edit
		@title = "Settings"
		@user = !params[:id].nil? ? User.find(params[:id]) : current_user
	end

	def update
		@title = "Settings"
		@user = !params[:id].nil? ? User.find(params[:id]) : current_user
		check_new_password
		if @user.update_attributes(params[:user])
			sign_in @user
			flash[:success] = "Profile successfully updated"
			redirect_to profile_path
		else
			flash.now[:error] = "New attributes with errors"
			render 'edit'
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

	   def signed_user
	      @user = !params[:id].nil? ? User.find(params[:id]) : current_user
	      if !current_user?(@user)
	        redirect_to root_path
	      end
	   end

      def check_new_password
      	params[:user].delete(:password) if params[:user][:password].blank?
      	params[:user].delete(:password_confirmation) if params[:user][:password_confirmation].blank?
      end
end
