class AnswerrelationsController < ApplicationController

before_action :logged_in_user
	def create
		@answer = Answer.find(params[:answer_id])
		if current_user.dislike_answer?(@answer)
			current_user.dislikedanswers.delete(@answer)
		end
		current_user.likedanswers << @answer
	end
	
	def destroy
		@answer = Answerrelation.find(params[:id]).answer
		current_user.likedanswers.delete(@answer)
	end

end
