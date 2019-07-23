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

ActiveRecord::Schema.define(version: 2019_07_23_071819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodations", force: :cascade do |t|
    t.datetime "date_created"
    t.string "name"
    t.text "description"
    t.string "country"
    t.string "city"
    t.string "address"
    t.bigint "user_id"
    t.float "accommodation_rating"
    t.datetime "available_start_date"
    t.datetime "available_end_date"
    t.bigint "accomtype_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accomtype_id"], name: "index_accommodations_on_accomtype_id"
    t.index ["user_id"], name: "index_accommodations_on_user_id"
  end

  create_table "accomtypes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.text "bio"
    t.integer "karma_coins"
    t.float "host_rating"
    t.float "guest_rating"
    t.bigint "user_id"
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "privilege"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stays", force: :cascade do |t|
    t.bigint "accommodation_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.boolean "confirmed"
    t.boolean "rejected"
    t.datetime "updated_at", null: false
    t.index ["accommodation_id"], name: "index_stays_on_accommodation_id"
    t.index ["user_id"], name: "index_stays_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "accommodations", "accomtypes"
  add_foreign_key "accommodations", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "stays", "accommodations"
  add_foreign_key "stays", "users"
  add_foreign_key "users", "roles"
end
