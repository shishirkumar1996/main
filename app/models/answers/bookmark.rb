module Answers
  class Bookmark < ApplicationRecord
    include ManyToManyRelatable
  end
end
