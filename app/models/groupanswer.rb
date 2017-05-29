class Groupanswer < ApplicationRecord

belongs_to :user
belongs_to :group_question
has_many :groupquestionreplies,dependent: :destroy

has_many :groupanswerrelations,foreign_key: :group_answer_id,
dependent: :destroy
has_many :likes,through: :groupanswerrelations,source: :user

has_many :badgroupanswerrelations,foreign_key: :group_answer_id,
dependent: :destroy
has_many :dislikes,through: :badgroupanswerrelations,source: :user


VALID_BODY_REGEX = /\A(?!(&nbsp;|<p>|<\/p>|\s)*\z).+/

validates :body,presence: true,format: {with: VALID_BODY_REGEX}

end
