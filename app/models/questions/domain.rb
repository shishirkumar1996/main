module Questions
  class Domain < ApplicationRecord
    extend ManyToManyRelatable
    self.table_name = underscored_name
    initialize_many_to_many [::Domain], [Question]
  end
end
