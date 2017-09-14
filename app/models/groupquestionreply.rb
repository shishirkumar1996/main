class Groupquestionreply < ApplicationRecord
	include Replyable
	belongs_to :groupanswer
end
