
class ApplicationController < ActionController::Base
	
	include SessionsHelper
  protect_from_forgery with: :exception
 # before_action :set_cache_headers
	before_action do
		if Rails.env.profile?
			Rack::MiniProfiler.authorize_request
		end
	end  
  
  def logged_in_user
  	unless logged_in?
  		store_location
  		flash[:danger] = "Please log in."
  		redirect_to root_url
  	end
  end
 
 def admin_user
 	unless current_user.admin?
 		redirect_to root_url
 	end
 end
  
  private
  # not removing it because it might be fruitful in future
 # 	def set_cache_headers
 # 		if request.xhr?
 # 			response.headers["Cache-Control"] = "no-cache, no-store,max-age = 0,must-revalidate"
  #			response.headers["Pragma"] = "no-cache"
  #			response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  #		end
  #	end
end
