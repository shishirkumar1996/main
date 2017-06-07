require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    created_notifications: Field::HasMany.with_options(class_name: "Notification"),
    answer_bookmark_relations: Field::HasMany,
    bookmarked_answers: Field::HasMany.with_options(class_name: "Answer"),
    question_bookmark_relations: Field::HasMany,
    bookmarked_questions: Field::HasMany.with_options(class_name: "Question"),
    article_bookmark_relations: Field::HasMany,
    bookmarked_articles: Field::HasMany.with_options(class_name: "Article"),
    articlerelations: Field::HasMany,
    likedarticles: Field::HasMany.with_options(class_name: "Article"),
    badarticlerelations: Field::HasMany,
    dislikedarticles: Field::HasMany.with_options(class_name: "Article"),
    grouparticlerelations: Field::HasMany,
    likedgrouparticles: Field::HasMany.with_options(class_name: "GroupArticle"),
    badgrouparticlerelations: Field::HasMany,
    dislikedgrouparticles: Field::HasMany.with_options(class_name: "GroupArticle"),
    answerrelations: Field::HasMany,
    likedanswers: Field::HasMany.with_options(class_name: "Answer"),
    badanswerrelations: Field::HasMany,
    dislikedanswers: Field::HasMany.with_options(class_name: "Answer"),
    groupanswerrelations: Field::HasMany,
    likedgroupanswers: Field::HasMany.with_options(class_name: "Groupanswer"),
    badgroupanswerrelations: Field::HasMany,
    dislikedgroupanswers: Field::HasMany.with_options(class_name: "Groupanswer"),
    notifications: Field::HasMany,
    articles: Field::HasMany,
    questions: Field::HasMany,
    answers: Field::HasMany,
    replies: Field::HasMany,
    articlereplies: Field::HasMany,
    interests: Field::HasMany,
    relations: Field::HasMany.with_options(class_name: "Domain"),
    academics: Field::HasMany,
    institutes: Field::HasMany,
    groups_users: Field::HasMany,
    groups: Field::HasMany,
    active_relationships: Field::HasMany.with_options(class_name: "Relationship"),
    passive_relationships: Field::HasMany.with_options(class_name: "Relationship"),
    following: Field::HasMany.with_options(class_name: "User"),
    followers: Field::HasMany.with_options(class_name: "User"),
    id: Field::Number,
    name: Field::String,
    email: Field::String,
    password_digest: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    provider: Field::String,
    oauth_token: Field::String,
    oauth_expires_at: Field::DateTime,
    uid: Field::String,
    remember_digest: Field::String,
    admin: Field::Boolean,
    image: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
		:name,
	  :email,
    :created_at,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :created_notifications,
    :answer_bookmark_relations,
    :bookmarked_answers,
    :question_bookmark_relations,
    :bookmarked_questions,
    :article_bookmark_relations,
    :bookmarked_articles,
    :articlerelations,
    :likedarticles,
    :badarticlerelations,
    :dislikedarticles,
    :grouparticlerelations,
    :likedgrouparticles,
    :badgrouparticlerelations,
    :dislikedgrouparticles,
    :answerrelations,
    :likedanswers,
    :badanswerrelations,
    :dislikedanswers,
    :groupanswerrelations,
    :likedgroupanswers,
    :badgroupanswerrelations,
    :dislikedgroupanswers,
    :notifications,
    :articles,
    :questions,
    :answers,
    :replies,
    :articlereplies,
    :interests,
    :relations,
    :academics,
    :institutes,
    :groups_users,
    :groups,
    :active_relationships,
    :passive_relationships,
    :following,
    :followers,
    :id,
    :name,
    :email,
    :password_digest,
    :created_at,
    :updated_at,
    :provider,
    :oauth_token,
    :oauth_expires_at,
    :uid,
    :remember_digest,
    :admin,
    :image,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :created_notifications,
    :answer_bookmark_relations,
    :bookmarked_answers,
    :question_bookmark_relations,
    :bookmarked_questions,
    :article_bookmark_relations,
    :bookmarked_articles,
    :articlerelations,
    :likedarticles,
    :badarticlerelations,
    :dislikedarticles,
    :grouparticlerelations,
    :likedgrouparticles,
    :badgrouparticlerelations,
    :dislikedgrouparticles,
    :answerrelations,
    :likedanswers,
    :badanswerrelations,
    :dislikedanswers,
    :groupanswerrelations,
    :likedgroupanswers,
    :badgroupanswerrelations,
    :dislikedgroupanswers,
    :notifications,
    :articles,
    :questions,
    :answers,
    :replies,
    :articlereplies,
    :interests,
    :relations,
    :academics,
    :institutes,
    :groups_users,
    :groups,
    :active_relationships,
    :passive_relationships,
    :following,
    :followers,
    :name,
    :email,
    :password_digest,
    :provider,
    :oauth_token,
    :oauth_expires_at,
    :uid,
    :remember_digest,
    :admin,
    :image,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
