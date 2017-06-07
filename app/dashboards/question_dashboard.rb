require "administrate/base_dashboard"

class QuestionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    question_bookmark_relations: Field::HasMany,
    following_user: Field::HasMany.with_options(class_name: "User"),
    user: Field::BelongsTo,
    domains_questions: Field::HasMany,
    domains: Field::HasMany,
    answers: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    description: Field::Text,
    anonymous: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :question_bookmark_relations,
    :following_user,
    :user,
    :domains_questions,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :question_bookmark_relations,
    :following_user,
    :user,
    :domains_questions,
    :domains,
    :answers,
    :id,
    :title,
    :description,
    :anonymous,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :question_bookmark_relations,
    :following_user,
    :user,
    :domains_questions,
    :domains,
    :answers,
    :title,
    :description,
    :anonymous,
  ].freeze

  # Overwrite this method to customize how questions are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(question)
  #   "Question ##{question.id}"
  # end
end
