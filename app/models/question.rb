class Question < ApplicationRecord
	
	belongs_to :user
	has_many :domains_questions, foreign_key: "question_id", dependent: :destroy
	has_many :domains, through :domains_questions
	has_many :domains
	has_many :answers  , dependent: :destroy
	validates :title, presence: true
end
