class Groupanswer < ApplicationRecord

belongs_to :user
belongs_to :group_question
has_many :groupquestionreplies,dependent: :destroy

end
