class RelationshipsController < ApplicationController

	before_action :logged_in_user
	
	def create
		@user = User.find(params[:followed_id])
		current_user.follow(@user)
		@notification = Notification.new
		#@path = user_path(current_user)
		@notification.message = "#{current_user.name} follows you now"
		@notification.link = "#{user_path(current_user)}"
		@notification.actor = current_user
		@user.notifications << @notification
		@notification.save!
		respond_to do |format|
			format.html {redirect_to @user}
			format.js
		end
	end
	
	def destroy
		@user = Relationship.find(params[:id]).followed
		current_user.unfollow(@user)
		@notification = @user.notifications.find_by(message: "#{current_user.name} follows you now")
		@user.notifications.delete(@notification)
		respond_to do |format|
			format.html {redirect_to @user}
			format.js
		end
	end

end
