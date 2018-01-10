module Articles
  class Upvote < ApplicationRecord
  	extend ManyToManyRelatable
    self.table_name = underscored_name.pluralize
    initialize_many_to_many [::User], [::Article]
    validate :user_is_not_author
=begin
    def user_is_not_author
      unless self.user_id.nil? && self.article_id.nil?
        self.errors.add :base, 'Author cannot upvote' if self.user_id == self.article.user_id
      end
    end
=end
  end
end
