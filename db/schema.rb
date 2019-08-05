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

ActiveRecord::Schema.define(version: 2019_07_30_065047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodationreviews", force: :cascade do |t|
    t.integer "communication_rating"
    t.integer "location_rating"
    t.integer "cleanliness_rating"
    t.integer "ammenities_rating"
    t.integer "host_rating"
    t.text "comments"
    t.datetime "created_at", null: false
    t.bigint "stay_id"
    t.datetime "updated_at", null: false
    t.index ["stay_id"], name: "index_accommodationreviews_on_stay_id"
  end

  create_table "accommodations", force: :cascade do |t|
    t.datetime "date_created"
    t.string "name"
    t.text "description"
    t.string "country"
    t.string "city"
    t.string "address"
    t.bigint "host_id"
    t.float "accommodation_rating"
    t.datetime "available_start_date"
    t.datetime "available_end_date"
    t.bigint "accomtype_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "longitude"
    t.float "latitude"
    t.index ["accomtype_id"], name: "index_accommodations_on_accomtype_id"
    t.index ["host_id"], name: "index_accommodations_on_host_id"
  end

  create_table "accomtypes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "guestreviews", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "cleanliness_rating"
    t.integer "communication_rating"
    t.integer "ease_of_hosting_rating"
    t.text "comments"
    t.bigint "stay_id"
    t.datetime "updated_at", null: false
    t.index ["stay_id"], name: "index_guestreviews_on_stay_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.bigint "stay_id"
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["stay_id"], name: "index_messages_on_stay_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
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
    t.bigint "guest_id"
    t.datetime "created_at", null: false
    t.boolean "confirmed"
    t.boolean "rejected"
    t.datetime "updated_at", null: false
    t.index ["accommodation_id"], name: "index_stays_on_accommodation_id"
    t.index ["guest_id"], name: "index_stays_on_guest_id"
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

  add_foreign_key "accommodationreviews", "stays"
  add_foreign_key "accommodations", "accomtypes"
  add_foreign_key "accommodations", "users", column: "host_id"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "guestreviews", "stays"
  add_foreign_key "messages", "stays"
  add_foreign_key "messages", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "stays", "accommodations"
  add_foreign_key "stays", "users", column: "guest_id"
  add_foreign_key "users", "roles"
end
