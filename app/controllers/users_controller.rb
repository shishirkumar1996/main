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
	def academic
		@user = User.find(params[:id])
	end
	
	def prepopulateacademic
		@academics = current_user.universities.map{|university| { :id => university.id, :text => university.name}}
		respond_to do |format|
			format.json{
				render :json => @academics
				}
			end
		
	end
	
	def addacademic
		@id = params[:academic]
		if(@id[0..2] == "<<<")
			@domain = Domain.new
			@domain.name = params[:academic][3..-4]
			@domain.save!
			@id = @domain.id
		end
		@academic = Domain.find(@id)
		current_user.universities<< @academic
		respond_to do |format|
			format.json
			format.html
		end
	end
	
	def removeinterest
		@academic = Domain.find(params[:academic])
		current_user.universities.delete(@academic)
	end
	
	
	def interest
		@user = User.find(params[:id])
	end
	
	
	
	def prepopulateinterest
		@interests = current_user.relations.map{|interest| { :id => interest.id, :text => interest.name}}
		respond_to do |format|
			format.json{
				render :json => @interests
				}
			end
		
	end
	
	
	def addinterest
		@id = params[:interest]
		if(@id[0..2] == "<<<")
			@domain = Domain.new
			@domain.name = params[:interest][3..-4]
			@domain.save!
			@id = @domain.id
		end
		@interest = Domain.find(@id)
		current_user.relations<< @interest
		respond_to do |format|
			format.json
			format.html
		end
	end
	
	def removeinterest
		@interest = Domain.find(params[:interest])
		current_user.relations.delete(@interest)
	end
	
	def following
		@title = "Following"
		@user = User.find(params[:id])
		@users = @user.following.all
		render 'show_follow'
	end
	
	def followers
		@title = "Followers"
		@user = User.find(params[:id])
		@users = @user.followers.all
		render 'show_follow'
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
			log_in @user
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
