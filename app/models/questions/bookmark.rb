module Questions
  class Bookmark < ApplicationRecord
  	include ManyToManyRelatable
  end
end
