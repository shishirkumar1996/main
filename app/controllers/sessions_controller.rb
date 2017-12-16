class SessionsController < ApplicationController

	def new
		redirect_to root_url
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			log_in user
			params[:session][:remember_me] == '1' ? remember(user) : forget(user)
			redirect_back_or(root_url)
		else
			flash.now[:danger] = 'Invalid email/password combination'
			render 'static_pages/home'
		end
	end

	def create_social
		redirect_to(root_url) if logged_in?
		user = User.find_or_create_from_auth_hash env["omniauth.auth"]
		log_in user
		remember user
		redirect_to root_url
	end

	def destroy
		log_out if logged_in?
		redirect_to root_url
	end

end
