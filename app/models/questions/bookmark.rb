module Questions
  class Bookmark < ApplicationRecord
    self.table_name = 'question_bookmarks'
  	belongs_to :user, class_name: '::User'
  	belongs_to :question, class_name: '::Question'
  	validates :user_id, presence: true
  	validates :question_id, presence: true
  	validates :user_id, uniqueness: { scope: :question_id }
  end
end
