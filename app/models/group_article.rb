class GroupArticle < ApplicationRecord
	belongs_to :group
	belongs_to :user
	has_many :grouparticlereplies, dependent: :destroy
	
	has_many :grouparticlerelations,foreign_key: :group_article_id,
	dependent: :destroy
	has_many :likes,through: :grouparticlerelations,source: :user
	
	has_many :badgrouparticlerelations,foreign_key: :group_article_id,
	dependent: :destroy
	has_many :dislikes,through: :badgrouparticlerelations,source: :user
	
	
	validates :title,presence: true
end
