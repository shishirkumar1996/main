class Academic < ApplicationRecord

belongs_to :user,foreign_key: :student_id
belongs_to :domain,foreign_key: :university_id
validates :university_id, presence: true
validates :student_id, presence: true

end
