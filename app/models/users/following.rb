module Users
  class Following < ApplicationRecord
    extend ManyToManyRelatable
    self.table_name = underscored_name.pluralize
    initialize_many_to_many [::User, 'followed'], [::User, 'follower']
  end
end
