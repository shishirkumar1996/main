class ApplicationController < ActionController::Base
	
	include SessionsHelper
  protect_from_forgery with: :exception
  before_action :set_cache_headers
  
  
  def logged_in_user
  	unless logged_in?
  		store_location
  		flash[:danger] = "Please log in."
  		redirect_to login_url
  	end
  end
  
  private
  	
  	def set_cache_headers
#  		if request.xhr?
  			response.headers["Cache-Control"] = "no-cache, no-store,max-age = 0,must-revalidate"
  			response.headers["Pragma"] = "no-cache"
  			response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
#  		end
  	end
end
