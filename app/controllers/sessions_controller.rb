class SessionsController < ApplicationController

	def new
		if logged_in?
			redirect_to root_url
		end
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			log_in user
			params[:session][:remember_me] == '1' ? remember(user) : forget(user)
			redirect_back_or(root_url)
		else
			flash.now[:danger] = 'Invalid email/password combination'
			render 'new'
		end
	end
	
	def create_google
		auth = request.env["omniauth.auth"]
		user = User.from_google_omniauth(request.env["omniauth.auth"])
		if(user.provider != auth.provider)
			flash[:danger] = 'email has already been taken'
			redirect_to root_url
		else
			log_in(user)
			remember(user)
			redirect_to root_url
		end
	end
	
	def create_facebook
		auth = request.env["omniauth.auth"]
		user= User.from_omniauth(request.env["omniauth.auth"])
		if(user.provider != auth.provider)
			flash[:danger] = 'email has already been taken'
			redirect_to root_url
		else
	#	session[:user_id] = user.id
			log_in(user)
			remember(user)
			redirect_to root_url
		end
	end

	def destroy
		log_out if logged_in?
		redirect_to root_url
	end
		
end
