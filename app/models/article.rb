class Article < ApplicationRecord

belongs_to :user
has_many :domains_articles, foreign_key: "article_id",dependent: :destroy
has_many :domains, through: :domains_articles
validates :title,presence: true
end
