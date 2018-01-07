module Users
  class Interest < ApplicationRecord
    self.table_name = underscored_name
    belongs_to :user, class_name: '::User'
    belongs_to :domain, class_name: '::Domain'
    validates :user_id, presence: true
    validates :domain_id, presence: true
    validates :user_id, uniqueness: { scope: domain_id }
  end
end
