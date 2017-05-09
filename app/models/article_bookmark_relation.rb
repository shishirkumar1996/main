class ArticleBookmarkRelation < ApplicationRecord

	belongs_to :user,foreign_key: :user_id
	belongs_to :article,foreign_key: :article_id
	validates :article_id, presence: true
	validates :user_id, presence: true

end