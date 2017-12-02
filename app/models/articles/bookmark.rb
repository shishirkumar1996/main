module Articles
  class Bookmark < ApplicationRecord
    self.table_name = 'article_bookmarks'
  	belongs_to :user, class_name: '::User'
  	belongs_to :article, class_name: '::Article'
  	validates :user_id, presence: true
  	validates :article_id, presence: true
  	validates :user_id, uniqueness: { scope: :article_id }
  end
end
