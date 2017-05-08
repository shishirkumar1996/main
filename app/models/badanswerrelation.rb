class Badanswerrelation < ApplicationRecord

belongs_to :answer,foreign_key: :answer_id
	belongs_to :user,foreign_key: :user_id
	validates :answer_id,presence: true
	validates :user_id,presence: true


end
