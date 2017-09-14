class AnswerReply < ApplicationRecord
  include Replyable
  belongs_to :answer
end
