module Answers
  class Upvote < ApplicationRecord
    include ManyToManyRelatable
  end
end
