class AnswerBookmarkRelationsController < ApplicationController

before_action :logged_in_user
	def create
		@answer = Answer.find(params[:answer_id])
		current_user.bookmarked_answers<<@answer
	end
	
	def destroy
		@answer = AnswerBookmarkRelation.find(params[:id]).answer
		current_user.bookmarked_answers.delete(@answer)
	end


end
