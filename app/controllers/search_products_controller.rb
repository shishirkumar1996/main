class SearchProductsController < ApplicationController

# the value is passed as params[:term]

	def index
	@u = User.search(params[:term]).to_a
	@user = @u.map{|x| {id: x.id,text: x.name,type: 'user'}}
	@article = Article.search(params[:term]).map{|x| {id: x.id,text: x.title,type: 'article'}}
	@question = Question.search(params[:term]).map{|x| {id: x.id,text: x.title,type: 'question'}}	
#	@article = Article.order(:title)
#	@question = Question.order(:title)
	@all = @user+@article+@question
	respond_to do |format|
		format.json{
	#	render json: @user.map(&:name)
		render json: @all
		}
	end	
end

end
