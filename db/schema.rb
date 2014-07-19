ActiveRecord::Schema.define(version: 20140715202143) do

  enable_extension "plpgsql"

  create_table "posts", force: true do |t|
    t.integer  "search_id",       null: false
    t.string   "title",           null: false
    t.integer  "price"
    t.string   "location"
    t.date     "date"
    t.text     "body"
    t.string   "page_href",       null: false
    t.string   "url",             null: false
    t.string   "google_maps_url"
    t.datetime "created_at"
    t.datetime "updated_at"
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
