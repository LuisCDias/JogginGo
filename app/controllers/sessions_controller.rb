class SessionsController < ApplicationController
	def new
		@title = "Signin"
	end

	def create
		@title = "Signin"
		#fazer login
		#senão
		render 'new'
	end

	def destroy
	end
end
