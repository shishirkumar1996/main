class StaticPagesController < ApplicationController

	def home
	@articles = Article.all
	@questions = Question.all
	@feed = (@articles+@questions).sort_by(&:created_at)
# @feed = Article.all.order('created_at')
	end
	
end
