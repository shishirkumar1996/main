require "administrate/base_dashboard"

class ArticleDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    article_bookmark_relations: Field::HasMany,
    following_users: Field::HasMany.with_options(class_name: "User"),
    articlereplies: Field::HasMany,
    domains_articles: Field::HasMany,
    domains: Field::HasMany,
    articlerelations: Field::HasMany,
    likes: Field::HasMany.with_options(class_name: "User"),
    badarticlerelations: Field::HasMany,
    dislikes: Field::HasMany.with_options(class_name: "User"),
    id: Field::Number,
    title: Field::String,
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
    :article_bookmark_relations,
    :following_users,
    :articlereplies,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :article_bookmark_relations,
    :following_users,
    :articlereplies,
    :domains_articles,
    :domains,
    :articlerelations,
    :likes,
    :badarticlerelations,
    :dislikes,
    :id,
    :title,
    :body,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :article_bookmark_relations,
    :following_users,
    :articlereplies,
    :domains_articles,
    :domains,
    :articlerelations,
    :likes,
    :badarticlerelations,
    :dislikes,
    :title,
    :body,
  ].freeze

  # Overwrite this method to customize how articles are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(article)
  #   "Article ##{article.id}"
  # end
end
