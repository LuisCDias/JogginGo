# encoding: UTF-8
class UsersController < ApplicationController
	before_filter :authorize, only: [:show, :edit, :update, :tracks]
	before_filter :signed_user, only: [:edit, :update]
	before_filter :already_signed, only:[:new, :create]
	before_filter :administration, only: [:destroy]
	before_filter :own_tracks, only: :show 
	allow_oauth! 

	def index
		@title = "Members"
		@users = User.all #substituir por paginate

	end

	def show
		@user = !params[:id].nil? ? User.find(params[:id]) : current_user
		@title = @user.username

		@tracks = @user.tracks
		track = params[:track_id].nil? ? @user.tracks.first : Track.find(params[:track_id])
		if !track.nil?
			@waypoints = waypoints_to_addresses(track.points)
			@first = @waypoints.shift
			@last = @waypoints.pop
			@all = track.timings
		else
			#tratar os casos em que o user não tem nenhuma track
			@waypoints = []
		end 
		respond_to do |format|
      		format.html # index.html.erb
      		format.json { render json: @user }
      		format.xml { render xml: @user }
    	end
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

	def destroy
		User.find(params[:id]).delete
		flash[:success] = "User successfully deleted"
		redirect_to users_path 
	end

	def tracks
		
		@user = !params[:id].nil? ? User.find(params[:id]) : current_user
		
		respond_to do |format|
      		format.json { render json: @user.tracks }
    	end
	end

	private 

		def administration
	      if current_user.nil? || !current_user.admin?
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

	   def own_tracks
	   	if !params[:track_id].nil?
		   	track = Track.find_by_id(params[:track_id])
		   	redirect_to profile_path if track.nil? || !(track.user_id == current_user.id) 
		end
	   end
end
