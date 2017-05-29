class Groupquestionreply < ApplicationRecord

	belongs_to :user
	belongs_to :groupanswer
	
	VALID_BODY_REGEX = /\A(?!(&nbsp;|<p>|<\/p>|\s)*\z).+/

validates :body,presence: true,format: {with: VALID_BODY_REGEX}
	
end
