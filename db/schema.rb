# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180107085106) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academics", force: :cascade do |t|
    t.integer  "institute_id"
    t.integer  "student_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["institute_id", "student_id"], name: "index_academics_on_institute_id_and_student_id", unique: true, using: :btree
    t.index ["institute_id"], name: "index_academics_on_institute_id", using: :btree
    t.index ["student_id"], name: "index_academics_on_student_id", using: :btree
  end

  create_table "answer_bookmarks", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "answer_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_answer_bookmarks_on_answer_id", using: :btree
    t.index ["user_id", "answer_id"], name: "index_answer_bookmarks_on_user_id_and_answer_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_answer_bookmarks_on_user_id", using: :btree
  end

  create_table "answer_downvotes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_answer_downvotes_on_answer_id", using: :btree
    t.index ["user_id", "answer_id"], name: "index_answer_downvotes_on_user_id_and_answer_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_answer_downvotes_on_user_id", using: :btree
  end

  create_table "answer_replies", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "answer_id"
    t.integer  "user_id"
    t.index ["answer_id"], name: "index_answer_replies_on_answer_id", using: :btree
    t.index ["user_id"], name: "index_answer_replies_on_user_id", using: :btree
  end

  create_table "answer_upvotes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_answer_upvotes_on_answer_id", using: :btree
    t.index ["user_id", "answer_id"], name: "index_answer_upvotes_on_user_id_and_answer_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_answer_upvotes_on_user_id", using: :btree
  end

  create_table "answers", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "user_id"
    t.integer  "question_id"
    t.boolean  "anonymous",   default: false
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
    t.index ["user_id"], name: "index_answers_on_user_id", using: :btree
  end

  create_table "article_bookmarks", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_bookmarks_on_article_id", using: :btree
    t.index ["user_id", "article_id"], name: "index_article_bookmarks_on_user_id_and_article_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_article_bookmarks_on_user_id", using: :btree
  end

  create_table "article_downvotes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id", "user_id"], name: "index_article_downvotes_on_article_id_and_user_id", unique: true, using: :btree
    t.index ["article_id"], name: "index_article_downvotes_on_article_id", using: :btree
    t.index ["user_id"], name: "index_article_downvotes_on_user_id", using: :btree
  end

  create_table "article_replies", force: :cascade do |t|
    t.text     "body",            null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id",         null: false
    t.integer  "article_id"
    t.integer  "parent_reply_id"
    t.index ["article_id"], name: "index_article_replies_on_article_id", using: :btree
    t.index ["parent_reply_id"], name: "index_article_replies_on_parent_reply_id", using: :btree
    t.index ["user_id"], name: "index_article_replies_on_user_id", using: :btree
  end

  create_table "article_upvotes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id", "user_id"], name: "index_article_upvotes_on_article_id_and_user_id", unique: true, using: :btree
    t.index ["article_id"], name: "index_article_upvotes_on_article_id", using: :btree
    t.index ["user_id"], name: "index_article_upvotes_on_user_id", using: :btree
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "user_id"
    t.integer  "article_replies_count", default: 0, null: false
    t.index ["user_id"], name: "index_articles_on_user_id", using: :btree
  end

  create_table "associated_sets", force: :cascade do |t|
    t.integer  "superset_id"
    t.integer  "subset_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["subset_id"], name: "index_associated_sets_on_subset_id", using: :btree
    t.index ["superset_id", "subset_id"], name: "index_associated_sets_on_superset_id_and_subset_id", unique: true, using: :btree
    t.index ["superset_id"], name: "index_associated_sets_on_superset_id", using: :btree
  end

  create_table "badgroupanswerrelations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_answer_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["group_answer_id"], name: "index_badgroupanswerrelations_on_group_answer_id", using: :btree
    t.index ["user_id", "group_answer_id"], name: "index_badgroupanswerrelations_on_user_id_and_group_answer_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_badgroupanswerrelations_on_user_id", using: :btree
  end

  create_table "badgrouparticlerelations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_article_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["group_article_id"], name: "index_badgrouparticlerelations_on_group_article_id", using: :btree
    t.index ["user_id", "group_article_id"], name: "index_badgrouparticlerelations_on_user_id_and_group_article_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_badgrouparticlerelations_on_user_id", using: :btree
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type", using: :btree
  end

  create_table "domains", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "available",  default: true
    t.boolean  "locked",     default: false
    t.string   "image"
  end

  create_table "domains_articles", force: :cascade do |t|
    t.integer "domain_id"
    t.integer "article_id"
    t.index ["article_id"], name: "index_domains_articles_on_article_id", using: :btree
    t.index ["domain_id", "article_id"], name: "index_domains_articles_on_domain_id_and_article_id", unique: true, using: :btree
    t.index ["domain_id"], name: "index_domains_articles_on_domain_id", using: :btree
  end

  create_table "domains_questions", force: :cascade do |t|
    t.integer "domain_id"
    t.integer "question_id"
    t.index ["domain_id", "question_id"], name: "index_domains_questions_on_domain_id_and_question_id", unique: true, using: :btree
    t.index ["domain_id"], name: "index_domains_questions_on_domain_id", using: :btree
    t.index ["question_id"], name: "index_domains_questions_on_question_id", using: :btree
  end

  create_table "group_articles", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "group_id"
    t.index ["group_id"], name: "index_group_articles_on_group_id", using: :btree
    t.index ["user_id"], name: "index_group_articles_on_user_id", using: :btree
  end

  create_table "group_questions", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "group_id"
    t.index ["group_id"], name: "index_group_questions_on_group_id", using: :btree
    t.index ["user_id"], name: "index_group_questions_on_user_id", using: :btree
  end

  create_table "groupanswerrelations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_answer_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["group_answer_id"], name: "index_groupanswerrelations_on_group_answer_id", using: :btree
    t.index ["user_id", "group_answer_id"], name: "index_groupanswerrelations_on_user_id_and_group_answer_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_groupanswerrelations_on_user_id", using: :btree
  end

  create_table "groupanswers", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "user_id"
    t.integer  "group_question_id"
    t.index ["group_question_id"], name: "index_groupanswers_on_group_question_id", using: :btree
    t.index ["user_id"], name: "index_groupanswers_on_user_id", using: :btree
  end

  create_table "grouparticlerelations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_article_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["group_article_id"], name: "index_grouparticlerelations_on_group_article_id", using: :btree
    t.index ["user_id", "group_article_id"], name: "index_grouparticlerelations_on_user_id_and_group_article_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_grouparticlerelations_on_user_id", using: :btree
  end

  create_table "grouparticlereplies", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.integer  "group_article_id"
    t.index ["group_article_id"], name: "index_grouparticlereplies_on_group_article_id", using: :btree
    t.index ["user_id"], name: "index_grouparticlereplies_on_user_id", using: :btree
  end

  create_table "groupquestionreplies", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.integer  "groupanswer_id"
    t.index ["groupanswer_id"], name: "index_groupquestionreplies_on_groupanswer_id", using: :btree
    t.index ["user_id"], name: "index_groupquestionreplies_on_user_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
  end

  create_table "groups_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institutes", force: :cascade do |t|
    t.string   "name"
    t.integer  "domain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["domain_id"], name: "index_institutes_on_domain_id", using: :btree
    t.index ["name"], name: "index_institutes_on_name", using: :btree
  end

  create_table "notifications", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "recipient_id",      null: false
    t.datetime "read_at"
    t.integer  "article_reply_id"
    t.integer  "answer_reply_id"
    t.integer  "answer_id"
    t.integer  "user_following_id"
    t.index ["recipient_id"], name: "index_notifications_on_recipient_id", using: :btree
  end

  create_table "question_bookmarks", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "question_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id", "question_id"], name: "index_question_bookmarks_on_user_id_and_question_id", unique: true, using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "anonymous"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id"
    t.integer  "answers_count", default: 0, null: false
    t.index ["user_id"], name: "index_questions_on_user_id", using: :btree
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  end

  create_table "search_products", force: :cascade do |t|
    t.string   "term"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_interests", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "domain_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["domain_id"], name: "index_user_interests_on_domain_id", using: :btree
    t.index ["user_id", "domain_id"], name: "index_user_interests_on_user_id_and_domain_id", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "provider"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "uid"
    t.string   "remember_digest"
    t.boolean  "admin",            default: false
    t.string   "image"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "answer_replies", "answers"
  add_foreign_key "answer_replies", "users"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "article_replies", "article_replies", column: "parent_reply_id"
  add_foreign_key "article_replies", "articles"
  add_foreign_key "article_replies", "users"
  add_foreign_key "articles", "users"
  add_foreign_key "group_articles", "groups"
  add_foreign_key "group_articles", "users"
  add_foreign_key "group_questions", "groups"
  add_foreign_key "group_questions", "users"
  add_foreign_key "groupanswers", "group_questions"
  add_foreign_key "groupanswers", "users"
  add_foreign_key "grouparticlereplies", "group_articles"
  add_foreign_key "grouparticlereplies", "users"
  add_foreign_key "groupquestionreplies", "groupanswers"
  add_foreign_key "groupquestionreplies", "users"
  add_foreign_key "institutes", "domains"
  add_foreign_key "notifications", "answer_replies"
  add_foreign_key "notifications", "answers"
  add_foreign_key "notifications", "article_replies"
  add_foreign_key "notifications", "relationships", column: "user_following_id"
  add_foreign_key "notifications", "users", column: "recipient_id"
  add_foreign_key "questions", "users"
end
