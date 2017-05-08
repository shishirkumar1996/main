class BadarticlerelationsController < ApplicationController

before_action :logged_in_user
	def create
		@article = Article.find(params[:article_id])
		if current_user.like_article?(@article)
			current_user.likedarticles.delete(@article)
		end
		current_user.dislikedarticles << @article
	end
	
	def destroy
		@article = Badarticlerelation.find(params[:id]).article
		current_user.dislikedarticles.delete(@article)
	end


end
