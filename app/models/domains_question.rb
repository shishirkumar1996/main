class DomainsQuestion < ApplicationRecord
	belongs_to :domain
	belongs_to :question
	validates :domain_id, presence: true
	validates :question_id , presence: true
	
end
