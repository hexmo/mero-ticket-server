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

ActiveRecord::Schema.define(version: 2022_04_23_052410) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "vehicle_id", null: false
    t.string "start_location"
    t.string "end_location"
    t.integer "eta"
    t.date "journery_date"
    t.time "journey_time"
    t.jsonb "seats", default: [{"id"=>"e99"}, {"id"=>"e100"}, {"id"=>"e1"}, {"id"=>"b1", "booked"=>false}, {"id"=>"b2", "booked"=>false}, {"id"=>"a1", "booked"=>false}, {"id"=>"a2", "booked"=>false}, {"id"=>"e2"}, {"id"=>"b3", "booked"=>false}, {"id"=>"b4", "booked"=>false}, {"id"=>"a3", "booked"=>false}, {"id"=>"a4", "booked"=>false}, {"id"=>"e3"}, {"id"=>"b5", "booked"=>false}, {"id"=>"b6", "booked"=>false}, {"id"=>"a5", "booked"=>false}, {"id"=>"a6", "booked"=>false}, {"id"=>"e5"}, {"id"=>"b7", "booked"=>false}, {"id"=>"b8", "booked"=>false}, {"id"=>"a7", "booked"=>false}, {"id"=>"a8", "booked"=>false}, {"id"=>"e6"}, {"id"=>"b9", "booked"=>false}, {"id"=>"b10", "booked"=>false}, {"id"=>"a9", "booked"=>false}, {"id"=>"a10", "booked"=>false}, {"id"=>"e7"}, {"id"=>"b11", "booked"=>false}, {"id"=>"b12", "booked"=>false}, {"id"=>"a11", "booked"=>false}, {"id"=>"a12", "booked"=>false}, {"id"=>"e8"}, {"id"=>"b13", "booked"=>false}, {"id"=>"b14", "booked"=>false}, {"id"=>"a13", "booked"=>false}, {"id"=>"a14", "booked"=>false}, {"id"=>"e8"}, {"id"=>"b15", "booked"=>false}, {"id"=>"b16", "booked"=>false}, {"id"=>"a15", "booked"=>false}, {"id"=>"a16", "booked"=>false}, {"id"=>"a17", "booked"=>false}, {"id"=>"b17", "booked"=>false}, {"id"=>"b18", "booked"=>false}]
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "ticket_price"
    t.index ["vehicle_id"], name: "index_bookings_on_vehicle_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "vehicle_id", null: false
    t.integer "rating"
    t.text "review"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
    t.index ["vehicle_id"], name: "index_reviews_on_vehicle_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "seats"
    t.integer "total_price"
    t.string "passenger_name"
    t.string "passenger_contact"
    t.bigint "user_id", null: false
    t.bigint "booking_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_tickets_on_booking_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "name"
    t.string "facility"
    t.bigint "user_id", null: false
    t.string "license_plate"
    t.text "description"
    t.bigint "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_vehicles_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "vehicles"
  add_foreign_key "reviews", "users"
  add_foreign_key "reviews", "vehicles"
  add_foreign_key "tickets", "bookings"
  add_foreign_key "tickets", "users"
  add_foreign_key "vehicles", "users"
end
