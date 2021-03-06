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

ActiveRecord::Schema.define(version: 2018_06_06_132452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "google_users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "google_sso_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "server", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "leaguename"
    t.integer "server", default: 0
    t.bigint "team_id"
    t.bigint "google_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["google_user_id"], name: "index_users_on_google_user_id"
    t.index ["team_id"], name: "index_users_on_team_id"
  end

  add_foreign_key "users", "google_users"
  add_foreign_key "users", "teams"
end
