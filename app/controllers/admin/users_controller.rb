module Admin
  class UsersController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    before_action :authenticate_admin
    
    
    # Define a custom finder by overriding the `find_resource` method:
   #  def find_resource(param)
   #    User.find_by!(slug: param)
   #  end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
