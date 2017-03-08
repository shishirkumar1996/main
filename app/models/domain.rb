class Domain < ApplicationRecord

validates :name, presence: :true, uniqueness: true, uniqueness: {case_sensitive: false}

has_many :articles
has_many :questions
has_many :interests, foreign_key: "interest_id",
										 dependent: :destroy
has_many :followers, through: :interests, source: :user
has_many :academics, foriegn_key: "university_id",
											dependent: :destroy
has_many: :students, through: :academics, source: :user
has_many :domains_questions, foriegn_key: "domain_id",
dependent: :destroy
has_many :questions, through: :domains_questions
has_many :domains_articles, foriegn_key: "domain_id",
dependent: :destroy
has_many :articles, through: :domains_articles

end
