class Article < ApplicationRecord
	include Bookmarkable
	include Votable
	include Replyable
	searchkick word_start: [:title]
	belongs_to :user
	has_many :replies, class_name: 'Articles::Reply'
	has_many :domains_articles, foreign_key: "article_id",dependent: :destroy
	has_many :domains, through: :domains_articles
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
