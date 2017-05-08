class Question < ApplicationRecord
	
	searchkick	

	has_many :question_bookmark_relations,foreign_key: :question_id,
	dependent: :destroy
	has_many :following_user,through: :question_bookmark_relations,
	source: :user

	belongs_to :user
	has_many :domains_questions, foreign_key: "question_id", dependent: :destroy
	has_many :domains, through: :domains_questions
	has_many :answers  , dependent: :destroy
	validates :title, presence: true
	
	def domain_tokens=(tokens)
		self.group_ids = Domain.ids_from_tokens(tokens)
	end
	
end
