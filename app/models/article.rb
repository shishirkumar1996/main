class Article < ApplicationRecord

searchkick
belongs_to :user

has_many :article_bookmark_relations,foreign_key: :article_id,
dependent: :destroy
has_many :following_users,through: :article_bookmark_relations,
source: :user

has_many :articlereplies, dependent: :destroy
has_many :domains_articles, foreign_key: "article_id",dependent: :destroy
has_many :domains, through: :domains_articles

has_many :articlerelations,foreign_key: :article_id,
dependent: :destroy
has_many :likes, through: :articlerelations,source: :user

has_many :badarticlerelations,foreign_key: :article_id,
dependent: :destroy
has_many :dislikes, through: :badarticlerelations,source: :user


validates :title,presence: true

def domain_tokens=(tokens)
	self.group_ids = Domain.ids_from_tokens(tokens)
end
end
