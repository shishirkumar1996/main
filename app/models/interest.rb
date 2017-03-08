class Interest < ApplicationRecord

belongs_to :user
belongs_to :domain
validates :interest_id, presence: true
validates :interested_id, presence: true

end
