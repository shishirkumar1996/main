module Bookmarkable
  extend ActiveSupport::Concern
  included do
    BOOKMARKED_ENTITY = "bookmarked_#{self.name.downcase.pluralize}".to_sym
    has_many :bookmarks, class_name: "#{self.name.pluralize}::Bookmark"
  end
  def bookmarked?(current_user)
    current_user.public_send(BOOKMARKED_ENTITY).include? self
  end
  def destroy_bookmark(current_user)
    current_user.public_send(BOOKMARKED_ENTITY).destroy self
  end
end
