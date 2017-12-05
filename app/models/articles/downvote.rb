module Articles
  class Downvote < ApplicationRecord
  	include ManyToManyRelatable
  end
end
