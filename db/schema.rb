# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_10_15_130243) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "searched_hits", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "author_id"
    t.index ["author_id"], name: "index_articles_on_author_id"
    t.index ["content"], name: "index_articles_on_content"
    t.index ["title"], name: "index_articles_on_title"
  end

  create_table "global_key_words_analytics", force: :cascade do |t|
    t.string "keyword"
    t.integer "current_day_hit", default: 0
    t.integer "previous_day_rank"
    t.integer "current_week_hit", default: 0
    t.integer "previous_week_rank"
    t.integer "current_month_hit", default: 0
    t.integer "previous_month_rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "previous_day_hit", default: 0
    t.integer "previous_week_hit", default: 0
    t.integer "previous_month_hit", default: 0
  end

  create_table "search_analytics", force: :cascade do |t|
    t.string "query"
    t.integer "searched", default: 0
    t.integer "found", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["query"], name: "index_search_analytics_on_query"
  end

  create_table "search_analytics_dates", force: :cascade do |t|
    t.bigint "search_analytic_id", null: false
    t.bigint "users_id", null: false
    t.date "searched_date"
    t.integer "hits", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["search_analytic_id"], name: "index_search_analytics_dates_on_search_analytic_id"
    t.index ["users_id"], name: "index_search_analytics_dates_on_users_id"
  end

  create_table "user_key_words_analytics", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.string "keywords"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_user_key_words_analytics_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "articles", "users", column: "author_id"
  add_foreign_key "search_analytics_dates", "search_analytics"
  add_foreign_key "search_analytics_dates", "users", column: "users_id"
  add_foreign_key "user_key_words_analytics", "users", column: "users_id"
end
