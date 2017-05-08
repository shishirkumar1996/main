class BadanswerrelationsController < ApplicationController

before_action :logged_in_user
	def create
		@answer = Answer.find(params[:answer_id])
		if current_user.like_answer?(@answer)
			current_user.likedanswers.delete(@answer)
		end
		current_user.dislikedanswers << @answer
	end
	
	def destroy
		@answer = Badanswerrelation.find(params[:id]).answer
		current_user.dislikedanswers.delete(@answer)
	end


end
