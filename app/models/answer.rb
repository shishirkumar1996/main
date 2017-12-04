class Answer < ApplicationRecord
  include Writable
  include Bookmarkable
  belongs_to :user
  belongs_to :question, counter_cache: true
  has_many :answer_replies , dependent: :destroy
  has_many :answerrelations,foreign_key: :answer_id,dependent: :destroy
  has_many :likes, through: :answerrelations, source: :user

  has_many :badanswerrelations,foreign_key: :answer_id,
  dependent: :destroy
  has_many :dislikes,through: :badanswerrelations,source: :user


  VALID_BODY_REGEX = /\A(?!(&nbsp;|<p>|<\/p>|\s)*\z).+/

  validates :body,presence: true,format: {with: VALID_BODY_REGEX}

end
