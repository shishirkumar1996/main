class Article < ApplicationRecord
	include Writable
	include Bookmarkable
	include Votable
	searchkick word_start: [:title]
	belongs_to :user
	has_many :replies, class_name: 'Articles::Reply'
	has_many :domains_articles, foreign_key: "article_id",dependent: :destroy
	has_many :domains, through: :domains_articles
	validates :title,presence: true
	VALID_BODY_REGEX = /\A(?!(&nbsp;|<p>|<\/p>|\s)*\z).+/
	validates :body,presence: true,format: {with: VALID_BODY_REGEX}

	def replies_all_levels
		all_replies = []
		stack = []
		replies.each do |top_reply|
			top_reply.level = 0
			stack << top_reply
		end
		until stack.empty?
			current_reply = stack.pop
			all_replies << current_reply
			current_reply.replies.each do |reply|
				reply.level = current_reply.level + 1
				stack << reply
			end
		end
		all_replies
	end

	def domain_tokens=(tokens)
		self.group_ids = Domain.ids_from_tokens(tokens)
	end

	def has_any_replies?
		article_replies_count > 0
	end

end
