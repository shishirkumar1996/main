module Answers
  class Bookmark < ApplicationRecord
    extend ManyToManyRelatable
    self.table_name = underscored_name
    initialize_many_to_many [::User], [::Answer]
  end
end
