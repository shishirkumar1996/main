module Bookmarkable
  extend ActiveSupport::Concern
  included do
    self.class_eval do
      class_plural = self.name.pluralize
      has_many :bookmarks, class_name: "#{class_plural}::Bookmark"
      class_plural = class_plural.underscore
      bookmarked_entities = "bookmarked_#{class_plural}".to_sym
      define_method(:bookmarked?) do |current_user|
        current_user.public_send(bookmarked_entities).include? self
      end
      define_method(:destroy_bookmark) do |current_user|
        current_user.public_send(bookmarked_entities).destroy self
      end
    end
  end
end
