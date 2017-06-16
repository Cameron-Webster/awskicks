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

ActiveRecord::Schema.define(version: 20170616162400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buckets", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_buckets_on_user_id", using: :btree
  end

  create_table "logos", force: :cascade do |t|
    t.string   "name"
    t.string   "photo"
    t.string   "home_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "scraper"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "pin_id"
    t.boolean  "read"
    t.string   "action"
    t.integer  "price_change"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.index ["pin_id"], name: "index_notifications_on_pin_id", using: :btree
    t.index ["user_id"], name: "index_notifications_on_user_id", using: :btree
  end

  create_table "pins", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "bucket_id"
    t.integer  "sneaker_id"
    t.integer  "price_watch"
    t.float    "stock_watch"
    t.index ["bucket_id"], name: "index_pins_on_bucket_id", using: :btree
    t.index ["sneaker_id"], name: "index_pins_on_sneaker_id", using: :btree
    t.index ["user_id"], name: "index_pins_on_user_id", using: :btree
  end

  create_table "sizes", force: :cascade do |t|
    t.float    "size_uk"
    t.float    "size_us"
    t.float    "size_eu"
    t.integer  "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vendor_id"], name: "index_sizes_on_vendor_id", using: :btree
  end

  create_table "sneakers", force: :cascade do |t|
    t.string   "name"
    t.string   "style_code"
    t.string   "color"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "photo"
    t.string   "gender"
    t.string   "brand"
    t.integer  "lowest_price"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.float    "footsize"
    t.string   "region"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "vendors", force: :cascade do |t|
    t.string   "name"
    t.integer  "current_price"
    t.integer  "previous_price"
    t.string   "url"
    t.string   "logo"
    t.integer  "lowest_price"
    t.integer  "sneaker_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "logo_id"
    t.index ["logo_id"], name: "index_vendors_on_logo_id", using: :btree
    t.index ["sneaker_id"], name: "index_vendors_on_sneaker_id", using: :btree
  end

  add_foreign_key "buckets", "users"
  add_foreign_key "notifications", "pins"
  add_foreign_key "notifications", "users"
  add_foreign_key "pins", "buckets"
  add_foreign_key "pins", "sneakers"
  add_foreign_key "pins", "users"
  add_foreign_key "sizes", "vendors"
  add_foreign_key "vendors", "logos"
  add_foreign_key "vendors", "sneakers"
end
