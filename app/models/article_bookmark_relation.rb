class ArticleBookmarkRelation < ApplicationRecord
	self.table_name = 'article_bookmarks'
	belongs_to :user
	belongs_to :article
	validates :article_id, presence: true
	validates :user_id, presence: true
	validates :user_id, uniqueness: { scope: :article_id }
end
