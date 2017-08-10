module CurrentUserConcern
  extend ActiveSupport::Concern

  def logged_in_user
  	unless logged_in?
  		store_location
  		flash[:danger] = "Please log in."
  		redirect_to root_url
  	end
  end

  def admin_user	
  	redirect_to root_url unless current_user.admin?
  end
end
