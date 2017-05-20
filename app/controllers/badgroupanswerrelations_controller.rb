class BadgroupanswerrelationsController < ApplicationController

	before_action :logged_in_user
	
	def create
		@answer = Groupanswer.find(params[:answer_id])
		if current_user.like_groupanswer?(@answer)
			current_user.likedgroupanswers.delete(@answer)
		end
		current_user.dislikedgroupanswers << @answer
	end
	
	def destroy
		@answer = Badgroupanswerrelation.find(params[:id]).groupanswer
		current_user.dislikedgroupanswers.delete(@answer)
	end

	private
	


end
