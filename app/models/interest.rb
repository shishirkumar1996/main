class Interest < ApplicationRecord

belongs_to :user,foreign_key: :person_id
belongs_to :domain,foreign_key: :interested_id
validates :person_id, presence: true
validates :interested_id, presence: true

end
