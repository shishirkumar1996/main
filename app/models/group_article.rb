class GroupArticle < ApplicationRecord
	belongs_to :group
	belongs_to :user
	has_many :grouparticlereplies, dependent: :destroy
	validates :title,presence: true
end
