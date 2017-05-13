class Institute < ApplicationRecord
  belongs_to :domain
  validates :name, :domain_id, presence: true
  has_many :academics, foreign_key: :institute_id, dependent: :destroy
  has_many :students, through: :academics, source: :user
end
