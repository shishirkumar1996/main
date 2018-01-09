module Questions
  class Domain < ApplicationRecord
    extend ManyToManyRelatable
    self.table_name = underscored_name.pluralize
    initialize_many_to_many [::Domain], [Question]
  end
end
