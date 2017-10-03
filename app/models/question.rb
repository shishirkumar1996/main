class Question < ApplicationRecord

	searchkick word_start: [:title], highlight: [:title], suggest: [:title]

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

	# Beware of anonymous, description and other attributes. If u want to include below, reindex
	def search_data
		{
			title: title,
			created_at: created_at,
			user_id: user_id
		}
	end
end
