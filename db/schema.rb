# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150820193220) do

  create_table "event_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "street",     limit: 255
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255
    t.integer  "zip_code",   limit: 4
  end

  create_table "events", force: :cascade do |t|
    t.integer  "event_type_id", limit: 4
    t.string   "name",          limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.datetime "date"
    t.string   "day",           limit: 255
    t.boolean  "completed",     limit: 1
  end

  create_table "notifications", force: :cascade do |t|
    t.text     "body",              limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "notification_type", limit: 255
  end

  create_table "preference_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "preferences", force: :cascade do |t|
    t.integer  "preference_type_id", limit: 4
    t.string   "name",               limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "address1",   limit: 255
    t.string   "address2",   limit: 255
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255, default: "IN"
    t.string   "zipcode",    limit: 255
    t.string   "phone",      limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "sub_event_description_joins", force: :cascade do |t|
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "sub_event_description_id", limit: 4
    t.integer  "sub_event_type_id",        limit: 4
  end

  create_table "sub_event_descriptions", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "sub_event_types", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "sub_events", force: :cascade do |t|
    t.integer  "event_id",          limit: 4
    t.string   "name",              limit: 255
    t.integer  "intern_num",        limit: 4
    t.integer  "staff_num",         limit: 4
    t.integer  "community_num",     limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "sub_event_type_id", limit: 4
  end

  create_table "user_notifications", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.integer  "notification_id", limit: 4
    t.boolean  "read",            limit: 1
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "user_preferences", force: :cascade do |t|
    t.integer  "preference_id", limit: 4
    t.integer  "user_id",       limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "user_restaurants", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "restaurant_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "user_sub_events", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "sub_event_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "fname",                  limit: 255
    t.string   "lname",                  limit: 255
    t.string   "role",                   limit: 255
    t.boolean  "approved",               limit: 1
    t.string   "street",                 limit: 255
    t.string   "city",                   limit: 255
    t.string   "state",                  limit: 255
    t.integer  "zip_code",               limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "volunteer_notes", force: :cascade do |t|
    t.integer  "user_id",            limit: 4
    t.integer  "created_by_user_id", limit: 4
    t.string   "description",        limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

end
