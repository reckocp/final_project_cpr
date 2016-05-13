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

ActiveRecord::Schema.define(version: 20160513174048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "location"
    t.integer  "user_id"
    t.string   "level"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.boolean  "read",            default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "politicians", force: :cascade do |t|
    t.string   "name"
    t.string   "party"
    t.text     "description"
    t.string   "served_area"
    t.string   "next_election"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "position"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "level"
    t.string   "summary"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "spotlights", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "date"
    t.string   "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.string   "level"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "upvotes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "upvotes", ["post_id"], name: "index_upvotes_on_post_id", using: :btree
  add_index "upvotes", ["user_id"], name: "index_upvotes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "username"
    t.string   "party"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "street"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "voting_histories", force: :cascade do |t|
    t.string   "bill_name"
    t.text     "description"
    t.string   "decision"
    t.integer  "politician_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "voting_histories", ["politician_id"], name: "index_voting_histories_on_politician_id", using: :btree

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "upvotes", "posts"
  add_foreign_key "upvotes", "users"
  add_foreign_key "voting_histories", "politicians"
end
