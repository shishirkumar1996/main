class GroupArticlesController < ApplicationController
before_action :logged_in_user,only: [:create,:new]

	def index
		@grouparticles = GroupArticle.all
	end
	
	
	def show
		@grouparticle = GroupArticle.find(params[:id])
	end
	
	
	def new
		@grouparticle = GroupArticle.new
		@group = Group.find(params[:group_id])
	end
	
	def create
		@group = Group.find(params[:group_id])
		@grouparticle = @group.group_articles.build(group_article_params)
		@grouparticle.user = current_user
		if @grouparticle.save
			flash[:success] = "article created"
			redirect_to @group
		else
			flash[:danger] = "some error occured!"
			render 'new'
		end
	end
	
	def edit
		@grouparticle = GroupArticle.find(params[:id])
		@group = Group.find(params[:group_id])
	end
	
	def update
		@group_article = GroupArticle.find(params[:id])
		if @group_article.update_attributes(group_article_params)	
			flash[:success] = "answer updated"
			redirect_to @group_article.group
		else
			flash[:danger] = "some error occured"
			render action: "edit"
		end
	end
		
			
		def collection
			@grouparticle = GroupArticle.find(params[:id])
			@grouparticlereplies = @grouparticle.grouparticlereplies.map{|reply| {:id => reply.id,:body=>reply.body,:created_at=>reply.created_at}}
			respond_to do |format|
				format.json{
					render :json => @grouparticlereplies }
				format.html
			end
		end	
		
	private
		
		def set_group_article
			@grouparticle = GroupArticle.find(params[:id])
		end
		
		def group_article_params
			params.require(:group_article).permit(:title,:body)
		end		
			
		
end
