class Institute < ApplicationRecord
  belongs_to :domain
  validates :name, presence: true,uniqueness: {case_sensitive: false}
  has_many :academics, foreign_key: :institute_id, dependent: :destroy
  has_many :students, through: :academics, source: :user
end
