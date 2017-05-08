class ArticleBookmarkRelationsController < ApplicationController

	before_action :logged_in_user
	def create
		@article= Article.find(params[:article_id])
		current_user.bookmarked_articles << @article
	end
	
	def destroy
		@article = ArticleBookmarkRelation.find(params[:id]).article
		current_user.bookmarked_articles.delete(@article)
	end

end
