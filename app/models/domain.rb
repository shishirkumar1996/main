class Domain < ApplicationRecord

validates :name, presence: :true, uniqueness: true, uniqueness: {case_sensitive: false}

has_many :articles
has_many :questions
has_many :interests, foreign_key: "interested_id",
										 dependent: :destroy
has_many :followers, through: :interests, source: :user
has_many :academics, foreign_key: "university_id",
											dependent: :destroy
has_many :students, through: :academics, source: :user
has_many :domains_questions, foreign_key: "domain_id",
dependent: :destroy
has_many :questions, through: :domains_questions
has_many :domains_articles, foreign_key: "domain_id",
dependent: :destroy
has_many :articles, through: :domains_articles


def self.ids_from_tokens(tokens)
	tokens.gsub!(/<<<(.+?)>>>/) {create!(name: $1.capitalize).id}
	tokens.split(',')
end


end
