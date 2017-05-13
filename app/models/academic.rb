class Academic < ApplicationRecord

belongs_to :user,foreign_key: :student_id
belongs_to :institute,foreign_key: :institute_id
validates :institute_id, presence: true
validates :student_id, presence: true
end
