module SessionsHelper

	def sign_in_and_remember(user)
		cookies.permanent[:remember_token] = user.remember_token
		self.current_user = user
	end

	def sign_in(user)
		cookies[:remember_token] = user.remember_token
		current_user = user
	end

	def current_user=(user)
		@current_user=user
	end

	def current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end

	def signed_in?
		!current_user.nil?
	end

	def current_user?(user)
		user == current_user
	end

	def sign_out
		self.current_user = nil
		cookies.delete :remember_token
		session[:return_to] = nil
	end

	def store_location
		session[:return_to] = request.fullpath
	end

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
