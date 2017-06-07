require "administrate/base_dashboard"

class GroupanswerDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    group_question: Field::BelongsTo,
    groupquestionreplies: Field::HasMany,
    groupanswerrelations: Field::HasMany,
    likes: Field::HasMany.with_options(class_name: "User"),
    badgroupanswerrelations: Field::HasMany,
    dislikes: Field::HasMany.with_options(class_name: "User"),
    id: Field::Number,
    body: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :group_question,
    :groupquestionreplies,
    :groupanswerrelations,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :group_question,
    :groupquestionreplies,
    :groupanswerrelations,
    :likes,
    :badgroupanswerrelations,
    :dislikes,
    :id,
    :body,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :group_question,
    :groupquestionreplies,
    :groupanswerrelations,
    :likes,
    :badgroupanswerrelations,
    :dislikes,
    :body,
  ].freeze

  # Overwrite this method to customize how groupanswers are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(groupanswer)
  #   "Groupanswer ##{groupanswer.id}"
  # end
end
