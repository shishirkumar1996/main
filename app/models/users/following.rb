module Users
  class Following < ApplicationRecord
    extend ManyToManyRelatable
    self.table_name = underscored_name.pluralize
    initialize_many_to_many [::User, 'followed'], [::User, 'follower']

    def notif_msg
  		follower_name = User.select(:name).find(follower_id).name
  		"#{follower_name} is following you"
  	end
  end
end
