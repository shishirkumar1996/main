class Answer < ApplicationRecord

belongs_to :user
belongs_to :question
has_many :replies , dependent: :destroy

has_many :answerrelations,foreign_key: :answer_id,dependent: :destroy
has_many :likes, through: :answerrelations, source: :user

has_many :badanswerrelations,foreign_key: :answer_id,
dependent: :destroy
has_many :dislikes,through: :badanswerrelations,source: :user

end
