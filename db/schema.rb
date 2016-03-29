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

ActiveRecord::Schema.define(version: 20160319101327) do

  create_table "excursions", force: :cascade do |t|
    t.string   "name"
    t.string   "duration"
    t.float    "price"
    t.date     "start"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "excursions_monuments", id: false, force: :cascade do |t|
    t.integer "monument_id"
    t.integer "excursion_id"
  end

  add_index "excursions_monuments", ["excursion_id"], name: "index_excursions_monuments_on_excursion_id"
  add_index "excursions_monuments", ["monument_id"], name: "index_excursions_monuments_on_monument_id"

  create_table "guides", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "phone",      null: false
    t.string   "email",      null: false
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monuments", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.float    "long"
    t.float    "lat"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "offers", force: :cascade do |t|
    t.integer  "excursion_id"
    t.integer  "user_id"
    t.string   "language"
    t.date     "date"
    t.integer  "available"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "offers", ["excursion_id"], name: "index_offers_on_excursion_id"
  add_index "offers", ["user_id"], name: "index_offers_on_user_id"

  create_table "tourists", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tours", force: :cascade do |t|
    t.integer  "excursion_id"
    t.integer  "guide_id"
    t.integer  "tourist_id"
    t.integer  "guide_point"
    t.integer  "excursion_point"
    t.text     "guide_description"
    t.text     "excursion_description"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "tours", ["excursion_id"], name: "index_tours_on_excursion_id"
  add_index "tours", ["guide_id"], name: "index_tours_on_guide_id"
  add_index "tours", ["tourist_id"], name: "index_tours_on_tourist_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name"
    t.string   "phone"
    t.string   "image"
    t.string   "role"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
