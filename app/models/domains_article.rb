class DomainsArticle < ApplicationRecord
	belongs_to :domain
	belongs_to :article
	validates :domain_id, presence: true
	validates :article_id , presence: true
end
