class QuestionBookmarkRelationsController < ApplicationController

before_action :logged_in_user
	def create
		@question = Question.find(params[:question_id])
		current_user.bookmarked_questions << @question
	end

	def destroy
		@question = QuestionBookmarkRelation.find(params[:id]).question
		current_user.bookmarked_questions.delete(@question)
	end

end
