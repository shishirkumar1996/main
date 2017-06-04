class QuestionsController < ApplicationController
  before_action :logged_in_user, except: [:show]
	before_action :admin_user,only: [:index]
  def index
    @questions = Question.all
  end

  def show
  	require 'will_paginate/array'
  	@question = Question.find(params[:id])
 		@answers = @question.answers.sort_by(&:created_at).reverse.paginate(page: params[:page],per_page: 2)
  end

  def new
    @question = Question.new
    @domains = Domain.all
    @questionterm = params[:questionterm]
  end

  def edit
  end
  

  def create
		@question = current_user.questions.build(question_params)
		@tokens = params[:domain_tokens]
		@tokens = @tokens.split(',')
		@tokens.each do |token|
			if(token[0..2]=="<<<")
				@domain = Domain.new
		#		token = token[0..-4]
				@domain.name = token[3..-4]
				@domain.save!
				token = @domain.id
			end
			d = Domain.find(token);
			d.questions << @question
		end
			
		
		if @question.save
			flash[:success] = "question submitted"
			redirect_to root_url
		else
			flash[:danger] = "some error occured"
			render 'new'
		end
   
  end

  def update
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title,:description,:anonymous,:domain_tokens,:anonymous)
    end
end
