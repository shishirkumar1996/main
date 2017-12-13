class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	include Authentication
	include ProfilerConcern

 # before_action :set_cache_headers
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
