class Answer < ApplicationRecord
  include Bookmarkable
  include Votable
  include Replyable
  belongs_to :user
  belongs_to :question, counter_cache: true
  has_many :replies, class_name: 'Answers::Reply' 
  VALID_BODY_REGEX = /\A(?!(&nbsp;|<p>|<\/p>|\s)*\z).+/
  validates :body, presence: true, format: { with: VALID_BODY_REGEX }
end
