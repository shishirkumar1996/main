require "administrate/base_dashboard"

class DomainDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    institute: Field::HasOne,
    articles: Field::HasMany,
    questions: Field::HasMany,
    bigger_sets: Field::HasMany.with_options(class_name: "AssociatedSet"),
    supersets: Field::HasMany.with_options(class_name: "Domain"),
    smaller_sets: Field::HasMany.with_options(class_name: "AssociatedSet"),
    subsets: Field::HasMany.with_options(class_name: "Domain"),
    interests: Field::HasMany,
    followers: Field::HasMany.with_options(class_name: "User"),
    domains_questions: Field::HasMany,
    domains_articles: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    available: Field::Boolean,
    locked: Field::Boolean,
    image: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :institute,
    :articles,
    :questions,
    :bigger_sets,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :institute,
    :articles,
    :questions,
    :bigger_sets,
    :supersets,
    :smaller_sets,
    :subsets,
    :interests,
    :followers,
    :domains_questions,
    :domains_articles,
    :id,
    :name,
    :created_at,
    :updated_at,
    :available,
    :locked,
    :image,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :institute,
    :articles,
    :questions,
    :bigger_sets,
    :supersets,
    :smaller_sets,
    :subsets,
    :interests,
    :followers,
    :domains_questions,
    :domains_articles,
    :name,
    :available,
    :locked,
    :image,
  ].freeze

  # Overwrite this method to customize how domains are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(domain)
  #   "Domain ##{domain.id}"
  # end
end
