class Article < ApplicationRecord


	searchkick word_start: [:title]
	belongs_to :user

	has_many :article_bookmark_relations,foreign_key: :article_id,
	dependent: :destroy
	has_many :following_users,through: :article_bookmark_relations,
	source: :user

	has_many :article_replies, dependent: :destroy
	has_many :domains_articles, foreign_key: "article_id",dependent: :destroy
	has_many :domains, through: :domains_articles

	has_many :articlerelations,foreign_key: :article_id,
	dependent: :destroy
	has_many :likes, through: :articlerelations,source: :user

	has_many :badarticlerelations,foreign_key: :article_id,
	dependent: :destroy
	has_many :dislikes, through: :badarticlerelations,source: :user


	validates :title,presence: true
	VALID_BODY_REGEX = /\A(?!(&nbsp;|<p>|<\/p>|\s)*\z).+/

	validates :body,presence: true,format: {with: VALID_BODY_REGEX}

	def domain_tokens=(tokens)
		self.group_ids = Domain.ids_from_tokens(tokens)
	end

	def has_any_replies?
		article_replies_count > 0
	end

end
