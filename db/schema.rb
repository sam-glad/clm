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

ActiveRecord::Schema.define(version: 20140720233923) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contact_infos", force: true do |t|
    t.integer  "search_id",  null: false
    t.string   "preferred"
    t.integer  "phone"
    t.string   "email"
    t.string   "email_link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.integer  "search_id",  null: false
    t.string   "title",      null: false
    t.integer  "price"
    t.string   "location"
    t.date     "date"
    t.text     "body"
    t.string   "page_href",  null: false
    t.string   "url",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
  end

  create_table "searches", force: true do |t|
    t.integer  "user_id"
    t.string   "query",                      null: false
    t.string   "location",                   null: false
    t.string   "category"
    t.integer  "min_price"
    t.integer  "max_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "has_img",    default: false
    t.datetime "run_time"
    t.boolean  "active",     default: true
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                   default: "member", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
