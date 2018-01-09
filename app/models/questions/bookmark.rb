module Questions
  class Bookmark < ApplicationRecord
  	extend ManyToManyRelatable
    self.table_name = underscored_name.pluralize
    initialize_many_to_many [::User], [::Question]
  end
end
