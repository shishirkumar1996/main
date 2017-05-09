class AnswerBookmarkRelation < ApplicationRecord

	belongs_to :user, foreign_key: :user_id
	belongs_to :answer,foreign_key: :answer_id
	validates :user_id,presence: true
	validates :answer_id, presence: true

end
