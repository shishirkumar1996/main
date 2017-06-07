class Answer < ApplicationRecord



belongs_to :user
belongs_to :question
has_many :replies , dependent: :destroy

has_many :answer_bookmark_relations,foreign_key: :answer_id,
dependent: :destroy
has_many :following_user,through: :answer_bookmark_relations,
source: :user


has_many :answerrelations,foreign_key: :answer_id,dependent: :destroy
has_many :likes, through: :answerrelations, source: :user

has_many :badanswerrelations,foreign_key: :answer_id,
dependent: :destroy
has_many :dislikes,through: :badanswerrelations,source: :user


VALID_BODY_REGEX = /\A(?!(&nbsp;|<p>|<\/p>|\s)*\z).+/

validates :body,presence: true,format: {with: VALID_BODY_REGEX}



end
