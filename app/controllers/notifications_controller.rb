class NotificationsController < ApplicationController

	before_action :logged_in_user
	before_action :same_user

	def index
		@notifications = current_user.notifications.unread
			respond_to do |format|
				format.html
#				format.json { render json: @notifications}
				format.js {render :layout=>false,content_type: 'text/javascript'}
			end
	end
	
	def show
	end
	
	def mark
		current_user.notifications.unread.update_all(read_at: Time.zone.now)
		end
	
	private
	
	def same_user
		if logged_in?
			if (current_user != User.find(params[:user_id]))
				redirect_to root_url
			end
		else
			redirect_to root_url
		end
	end
	
	
end
