class StaticPagesController < ApplicationController

	def home
	@articles = Article.all
	@questions = Question.all
	@feed = (@articles+@questions).sort_by(&:created_at).reverse
# @feed = Article.all.order('created_at')
	end
	
	def check_existing
		respond_to do |format|
		#format.js {render :layout=> false,content_type: 'text/javascript'}
		format.html
		end
	end
	
	def search_question
		@value = Question.search(params[:term]).to_a.map{|x| {id: x.id,text: x.title}}
		respond_to do |format|
			format.json{	render json: @value}
			format.html
		end
		
	end
	
end
