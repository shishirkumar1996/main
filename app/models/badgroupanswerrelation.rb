class Badgroupanswerrelation < ApplicationRecord

belongs_to :groupanswer,foreign_key: :group_answer_id
	belongs_to :user,foreign_key: :user_id
	validates :group_answer_id,presence: true
	validates :user_id,presence: true

end
