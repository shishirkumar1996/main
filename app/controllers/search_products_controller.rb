class SearchProductsController < ApplicationController

	def index
	@user = User.order(:name)
	@article = Article.order(:title)
	@question = Question.order(:title)
	#	render json: @user.map(&:name)
		render json: @user.map{|x| "#{x.id},#{x.name}"}
	end
	
end
