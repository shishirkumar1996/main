class GroupQuestion < ApplicationRecord
	belongs_to :group
	belongs_to :user
	validates :title, presence: true
	has_many :groupanswers,dependent: :destroy
end
