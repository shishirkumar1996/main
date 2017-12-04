module Articles
  class Bookmark < ApplicationRecord
  	include ManyToManyRelatable
  end
end
