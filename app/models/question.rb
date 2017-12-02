class Question < ApplicationRecord
	include Bookmarkable
	include Writable
	searchkick word_start: [:title], highlight: [:title], suggest: [:title]
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
