module Answers
  class Downvote < ApplicationRecord
    include ManyToManyRelatable
  end
end
