class Badgrouparticlerelation < ApplicationRecord
belongs_to :group_article,foreign_key: :group_article_id
	belongs_to :user,foreign_key: :user_id
	validates :group_article_id,presence: true
	validates :user_id,presence: true

end
