class GroupQuestion < ApplicationRecord
	belongs_to :group
	validates :title, presence: true
end
