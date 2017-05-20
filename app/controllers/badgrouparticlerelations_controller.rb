class BadgrouparticlerelationsController < ApplicationController

before_action :logged_in_user

	def create
		@article = GroupArticle.find(params[:article_id])
		if current_user.like_grouparticle?(@article)
			current_user.likedgrouparticles.delete(@article)
		end
		current_user.dislikedgrouparticles << @article
	end
	
	def destroy
		@article = Badgrouparticlerelation.find(params[:id]).group_article
		current_user.dislikedgrouparticles.delete(@article)
	end

	private
	


end
