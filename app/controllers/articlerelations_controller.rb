class ArticlerelationsController < ApplicationController


before_action :logged_in_user
	def create
		@article = Article.find(params[:article_id])
		if current_user.dislike_article?(@article)
			current_user.dislikedarticles.delete(@article)
		end
		current_user.likedarticles << @article
	end
	
	def destroy
		@article = Articlerelation.find(params[:id]).article
		current_user.likedarticles.delete(@article)
	end


end
