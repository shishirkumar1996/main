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
	
	VALID_BODY_REGEX = /\A(?!(&nbsp;|<p>|<\/p>|\s)*\z).+/

validates :body,presence: true,format: {with: VALID_BODY_REGEX}
	validates :title,presence: true
end
