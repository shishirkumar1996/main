module BookmarksHelper
  def display_bookmark(entity, bookmarked = nil)
    bookmarked = entity.bookmarked?(current_user) if bookmarked.nil?
    if bookmarked
      http_method = :delete
      button_label = 'Unbookmark'
    else
      http_method = :post
      button_label = 'Bookmark'
    end
    form_tag(bookmarks_path, method: http_method, remote: true) do
      concat hidden_field_tag(:type, entity.type_name)
      concat hidden_field_tag(:id, entity.id)
      concat submit_tag(button_label, class: 'btn-common btn-action btn-bookmark')
    end
  end
end
