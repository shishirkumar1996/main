class Academic < ApplicationRecord

belongs_to :user
belongs_to :domain
validates: :university_id, presence: true
validates: :academic_id, presence: true

end
