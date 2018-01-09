module Users
  class Interest < ApplicationRecord
    extend ManyToManyRelatable
    self.table_name = underscored_name
    initialize_many_to_many [::User], [::Domain]
  end
end
