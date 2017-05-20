class GroupanswerrelationsController < ApplicationController

before_action :logged_in_user
	
	def create
		@answer = Groupanswer.find(params[:answer_id])
		if current_user.dislike_groupanswer?(@answer)
			current_user.dislikedgroupanswers.delete(@answer)
		end
		current_user.likedgroupanswers << @answer
	end
	
	def destroy
		@answer = Groupanswerrelation.find(params[:id]).groupanswer
		current_user.likedgroupanswers.delete(@answer)
	end
	
	private
	
	
	
	
end
