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

ActiveRecord::Schema.define(version: 20170321104756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academics", force: :cascade do |t|
    t.integer  "university_id"
    t.integer  "student_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["student_id"], name: "index_academics_on_student_id", using: :btree
    t.index ["university_id", "student_id"], name: "index_academics_on_university_id_and_student_id", unique: true, using: :btree
    t.index ["university_id"], name: "index_academics_on_university_id", using: :btree
  end

  create_table "answers", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "question_id"
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
    t.index ["user_id"], name: "index_answers_on_user_id", using: :btree
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "domain_id"
    t.index ["domain_id"], name: "index_articles_on_domain_id", using: :btree
    t.index ["user_id"], name: "index_articles_on_user_id", using: :btree
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.index ["group_id"], name: "index_groups_users_on_group_id", using: :btree
    t.index ["user_id"], name: "index_groups_users_on_user_id", using: :btree
  end

  create_table "interests", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "interested_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["interested_id"], name: "index_interests_on_interested_id", using: :btree
    t.index ["person_id", "interested_id"], name: "index_interests_on_person_id_and_interested_id", unique: true, using: :btree
    t.index ["person_id"], name: "index_interests_on_person_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "anonymous"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "domain_id"
    t.index ["domain_id"], name: "index_questions_on_domain_id", using: :btree
    t.index ["user_id"], name: "index_questions_on_user_id", using: :btree
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
    t.index ["follower_id"], name: "index_relationships_on_follower_id", using: :btree
  end

  create_table "replies", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "answer_id"
    t.integer  "user_id"
    t.index ["answer_id"], name: "index_replies_on_answer_id", using: :btree
    t.index ["user_id"], name: "index_replies_on_user_id", using: :btree
  end

  create_table "search_products", force: :cascade do |t|
    t.string   "term"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "articles", "domains"
  add_foreign_key "articles", "users"
  add_foreign_key "group_questions", "groups"
  add_foreign_key "group_questions", "users"
  add_foreign_key "questions", "domains"
  add_foreign_key "questions", "users"
  add_foreign_key "replies", "answers"
  add_foreign_key "replies", "users"
end
