class AnswerBookmarkRelation < ApplicationRecord
	self.table_name = 'answer_bookmarks'
	belongs_to :user
	belongs_to :answer
	validates :user_id, presence: true
	validates :answer_id, presence: true
	validates :user_id, uniqueness: { scope: :answer_id }
end
