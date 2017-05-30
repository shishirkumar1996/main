class UsersController < ApplicationController

	before_action :logged_in_user,except: [:show,:index,:new,:create]
	before_action :same_user, only: [:edit_image,:edit_password,:edit_name,:update_name,:update_password]
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
		respond_to do |format|
#			format.js{render :layout=>false,content_type: 'text/javascript'}
			format.html
		end
	end
	
	def prepopulateacademic
		@academics = current_user.institutes.map{|institute| { :id => institute.id, :text => institute.name}}
		respond_to do |format|
			format.json{
				render :json => @academics
				}
			end
		
	end
	
	def addacademic
		@id = params[:academic]
		if(@id[0..2] == "<<<")
			@institute = Institute.new
			@institute.name = params[:academic][3..-4]
			@institute.save!
			@id = @institute.id
		end
		@academic = Institute.find(@id)
		current_user.institutes<< @academic
		if(Domain.exists?(:name => @academic.name))
			@domain = Domain.find(@id)
			@academic.domain  = @domain
		else
			@domain = Domain.new
			@domain.name  = @academic.name
			@academic.domain = @domain
			@domain.save!
		end
		respond_to do |format|
			format.json
			format.html
		end
	end
	
	def removeacademic
		@academic = Institute.find(params[:academic])
		current_user.universities.delete(@academic)
	end
	
	
	
	
	def interest
		@user = User.find(params[:id])
		respond_to do |format|
#			format.js{render :layout=>false,content_type: 'text/javascript'}
			format.html
		end
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
	
	def edit_image
	end
	
	
	def image
		current_user.image = params[:image]
		current_user.save!
		redirect_to edit_image_user_path(current_user)
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
	
	def edit_name
		@user= User.find(params[:id])
			respond_to do |format|
				format.js { render :layout=>false,content_type: 'text/javascript' }
				format.html
			end
	end
	
	def edit_password
		@user = User.find(params[:id])
	end
	
	def update_name
		@user = User.find(params[:id])	
		
		 if @user.update_attributes(user_params)
		 	flash[:success] = "name updated"
		else
			flash[:danger] = "some error occured"
		end
		redirect_to edit_user_path(@user)
	end
	
	def update_password
		@user = User.find(params[:id])
		if(@user.authenticate(params[:user][:old_password]) && @user.update_attributes(user_params))
			flash[:success] = "password updated"
			redirect_to user_path(@user)
		else
		flash[:danger] = "some error occured"
		redirect_to edit_password_user_path(@user)
		end
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
		require 'will_paginate/array'
		@user = User.find(params[:id])
		@useranswer = []
		@user.answers.each do |answer|
			@useranswer << answer.question
		end   
		#answers of different questions to be added in the feed
		@feed = (@user.articles+@useranswer).sort_by(&:created_at).reverse.paginate(page: params[:page],per_page: 2)
		respond_to do |format|
			format.html
			format.js
		end
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
		params.require(:user).permit(:name,:email,:password,:password_confirmation,:remote_image_url)
	end
	
	def same_user
		unless(current_user == User.find(params[:id]))
			redirect_to root_url
		end
	end
	
	
end
