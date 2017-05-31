class Notification < ApplicationRecord
	belongs_to :user
	belongs_to :actor,foreign_key: :actor_id,class_name: "User"
	validates :actor_id,presence: true
	
	scope :unread,-> {where(read_at: nil)}
end
