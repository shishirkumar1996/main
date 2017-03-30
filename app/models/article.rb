class Article < ApplicationRecord


searchkick
belongs_to :user
has_many :domains_articles, foreign_key: "article_id",dependent: :destroy
has_many :domains, through: :domains_articles
validates :title,presence: true

def domain_tokens=(tokens)
	self.group_ids = Domain.ids_from_tokens(tokens)
end
end
