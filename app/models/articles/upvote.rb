module Articles
  class Upvote < ApplicationRecord
  	include ManyToManyRelatable
  end
end
