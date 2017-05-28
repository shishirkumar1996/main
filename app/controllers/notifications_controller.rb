class NotificationsController < ApplicationController

	def index
		@notifications = current_user.notifications.unread
			respond_to do |format|
				format.html
	#			format.json
				format.js {render :layout=>false,content_type: 'text/javascript'}
			end
	end
	
	def show
	end
	
	def mark
		current_user.notifications.unread.update_all(read_at: Time.zone.now)
		end
	
end
