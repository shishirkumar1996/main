class InterestsController < ApplicationController

	before_action :logged_in_user
	
	def create
		@domain = Domain.find(params[:interest_id])
		current_user.relations << @domain
		
		respond_to do |format|
			format.html {redirect_to @user}
			format.js
		end
	end
		
	def destroy
		@domain = Interest.find(params[:id]).domain
		current_user.relations.delete(@domain)
		respond_to do |format|
			format.html {redirect_to @user}
			format.js
		end
	end


end
