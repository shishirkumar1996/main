require "administrate/base_dashboard"

class AnswerDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    question: Field::BelongsTo,
    replies: Field::HasMany,
    answer_bookmark_relations: Field::HasMany,
    following_user: Field::HasMany.with_options(class_name: "User"),
    answerrelations: Field::HasMany,
    likes: Field::HasMany.with_options(class_name: "User"),
    badanswerrelations: Field::HasMany,
    dislikes: Field::HasMany.with_options(class_name: "User"),
    id: Field::Number,
    body: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    anonymous: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :question,
    :replies,
    :answer_bookmark_relations,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :question,
    :replies,
    :answer_bookmark_relations,
    :following_user,
    :answerrelations,
    :likes,
    :badanswerrelations,
    :dislikes,
    :id,
    :body,
    :created_at,
    :updated_at,
    :anonymous,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :question,
    :replies,
    :answer_bookmark_relations,
    :following_user,
    :answerrelations,
    :likes,
    :badanswerrelations,
    :dislikes,
    :body,
    :anonymous,
  ].freeze

  # Overwrite this method to customize how answers are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(answer)
  #   "Answer ##{answer.id}"
  # end
end
