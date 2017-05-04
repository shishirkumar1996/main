class AssociatedSet < ApplicationRecord
	belongs_to :superset,foreign_key: :superset_id,class_name: "Domain"
	belongs_to :subset,foreign_key: :subset_id,class_name: "Domain"
	validates :superset_id, presence: true
	validates :subset_id, presence: true
end
