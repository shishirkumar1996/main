module Answers
  class Bookmark < ApplicationRecord
    self.table_name = 'answer_bookmarks'
  	belongs_to :user, class_name: '::User'
  	belongs_to :answer, class_name: '::Answer'
  	validates :user_id, presence: true
  	validates :question_id, presence: true
  	validates :user_id, uniqueness: { scope: :answer_id }
  end
end
