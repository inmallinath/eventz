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

ActiveRecord::Schema.define(version: 20160326062208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "description"
    t.string   "zip"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "city_id"
    t.integer  "state_id"
    t.integer  "country_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "addresses", ["city_id"], name: "index_addresses_on_city_id", using: :btree
  add_index "addresses", ["country_id"], name: "index_addresses_on_country_id", using: :btree
  add_index "addresses", ["state_id"], name: "index_addresses_on_state_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "code"
    t.string   "description"
    t.integer  "state_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "event_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.boolean  "paid"
    t.decimal  "price"
    t.string   "recurrring"
    t.datetime "date"
    t.datetime "start"
    t.datetime "end"
    t.integer  "day_of_week"
    t.text     "event_data"
    t.integer  "address_id"
    t.integer  "event_category_id"
    t.integer  "unit_id"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "events", ["address_id"], name: "index_events_on_address_id", using: :btree
  add_index "events", ["event_category_id"], name: "index_events_on_event_category_id", using: :btree
  add_index "events", ["unit_id"], name: "index_events_on_unit_id", using: :btree
  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "organization_addresses", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "address_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "organization_addresses", ["address_id"], name: "index_organization_addresses_on_address_id", using: :btree
  add_index "organization_addresses", ["organization_id"], name: "index_organization_addresses_on_organization_id", using: :btree

  create_table "organization_events", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "event_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "organization_events", ["event_id"], name: "index_organization_events_on_event_id", using: :btree
  add_index "organization_events", ["organization_id"], name: "index_organization_events_on_organization_id", using: :btree

  create_table "organization_units", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "unit_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "organization_units", ["organization_id"], name: "index_organization_units_on_organization_id", using: :btree
  add_index "organization_units", ["unit_id"], name: "index_organization_units_on_unit_id", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.string   "code"
    t.string   "description"
    t.string   "url"
    t.string   "logo"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "organizations", ["user_id"], name: "index_organizations_on_user_id", using: :btree

  create_table "providers", force: :cascade do |t|
    t.string   "name"
    t.string   "api_key"
    t.string   "token"
    t.string   "secret"
    t.text     "raw_data"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "providers", ["user_id"], name: "index_providers_on_user_id", using: :btree

  create_table "states", force: :cascade do |t|
    t.string   "code"
    t.string   "description"
    t.integer  "country_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "states", ["country_id"], name: "index_states_on_country_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["user_id"], name: "index_taggings_on_user_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unit_types", force: :cascade do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "units", force: :cascade do |t|
    t.string   "code"
    t.string   "description"
    t.integer  "capacity"
    t.integer  "unit_type_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "units", ["unit_type_id"], name: "index_units_on_unit_type_id", using: :btree

  create_table "user_events", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_events", ["event_id"], name: "index_user_events_on_event_id", using: :btree
  add_index "user_events", ["user_id"], name: "index_user_events_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_name"
    t.string   "email"
    t.string   "mobile"
    t.string   "password_digest"
    t.string   "role"
    t.boolean  "admin"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "auth_token"
    t.integer  "address_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "users", ["address_id"], name: "index_users_on_address_id", using: :btree

  add_foreign_key "addresses", "cities"
  add_foreign_key "addresses", "countries"
  add_foreign_key "addresses", "states"
  add_foreign_key "cities", "states"
  add_foreign_key "events", "addresses"
  add_foreign_key "events", "event_categories"
  add_foreign_key "events", "units"
  add_foreign_key "events", "users"
  add_foreign_key "organization_addresses", "addresses"
  add_foreign_key "organization_addresses", "organizations"
  add_foreign_key "organization_events", "events"
  add_foreign_key "organization_events", "organizations"
  add_foreign_key "organization_units", "organizations"
  add_foreign_key "organization_units", "units"
  add_foreign_key "organizations", "users"
  add_foreign_key "providers", "users"
  add_foreign_key "states", "countries"
  add_foreign_key "taggings", "tags"
  add_foreign_key "taggings", "users"
  add_foreign_key "units", "unit_types"
  add_foreign_key "user_events", "events"
  add_foreign_key "user_events", "users"
  add_foreign_key "users", "addresses"
end
