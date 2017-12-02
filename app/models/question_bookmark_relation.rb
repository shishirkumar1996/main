class QuestionBookmarkRelation < ApplicationRecord
	self.table_name = 'question_bookmarks'
	belongs_to :user,foreign_key: :user_id
	belongs_to :question, foreign_key: :question_id
	validates :user_id,presence: true
	validates :question_id, presence: true

end
