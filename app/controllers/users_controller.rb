class UsersController < ApplicationController

	before_action :logged_in_user, only:
	[:update, :destroy]
	def index
	@users = User.where("name ILIKE ?","%#{params[:term]}%").map{|user| {:id=>user.id,:text =>user.name}}
	
	respond_to do |format|
		format.json {
			render :json =>@users
			}
		end
	end
	
	def index_group
		@groups = current_user.groups
	end
	
	def edit
		@user = User.find(params[:id])
	end	
	
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_url
			else
			render 'new'
		end
	end
	
	def show
		@user = User.find(params[:id])
	end
	
	def update
	end
		
	
	def write
		respond_to do |format|
			format.js
			format.html
		end
	end
	
private

	def user_params
		params.require(:user).permit(:name,:email,:password,:password_confirmation)
	end

end
