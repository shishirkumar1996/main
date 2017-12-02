class QuestionBookmarkRelation < ApplicationRecord
	self.table_name = 'question_bookmarks'
	belongs_to :user
	belongs_to :question
	validates :user_id, presence: true
	validates :question_id, presence: true
	validates :user_id, uniqueness: { scope: :question_id }
end
