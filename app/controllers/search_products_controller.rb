class SearchProductsController < ApplicationController

# the value is passed as params[:term]
	before_action :logged_in_user	
	
	def index
	@option = params[:options];
	@value;
	if(@option == "users")
	@value = User.search(params[:term],fields: [{name: :word_start}]).to_a.map{|x| {id: x.id,text: x.name,type: 'user'}}
	elsif(@option == "domains")
	@value = Domain.search(params[:term],fields: [{name: :word_start}]).to_a.map{|x| {id: x.id,text: x.name , type: 'domain'}}
	elsif(@option == "articles")
	@value = Article.search(params[:term],fields: [{title: :word_start}]).to_a.map{|x| {id: x.id,text: x.title,type: 'article'}}
	elsif(@option== "questions")
	@value = Question.search(params[:term],fields: [{title: :word_start}]).to_a.map{|x| {id: x.id,text: x.title,type: 'question'}}
	end	
#	@article = Article.order(:title)
#	@question = Question.order(:title)
	respond_to do |format|
		format.json{
	#	render json: @user.map(&:name)
		render json: @value
		}
		format.html
	end	
end

end
