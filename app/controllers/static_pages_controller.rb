class StaticPagesController < ApplicationController
	before_action :logged_in_user	,except: [:home]


	def home

		if logged_in?
			require 'will_paginate/array'
			@articles = Article.all
			@questions = Question.all
			@feed = (@articles+@questions).sort_by(&:created_at).reverse.paginate(page: params[:page],per_page: 6)
			respond_to do |format|
				format.js
				format.html
			end
		end
	end

	def dummy
	respond_to do |format|
	format.js
	end
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
