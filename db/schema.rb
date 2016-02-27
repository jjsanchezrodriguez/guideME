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

ActiveRecord::Schema.define(version: 20160227151925) do

  create_table "excursions", force: :cascade do |t|
    t.string   "name"
    t.string   "duration"
    t.float    "price"
    t.time     "start"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "guides", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
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

  create_table "monuments_excursions", id: false, force: :cascade do |t|
    t.integer "monument_id"
    t.integer "excursion_id"
  end

  add_index "monuments_excursions", ["excursion_id"], name: "index_monuments_excursions_on_excursion_id"
  add_index "monuments_excursions", ["monument_id"], name: "index_monuments_excursions_on_monument_id"

  create_table "offers", force: :cascade do |t|
    t.integer  "excurion_id"
    t.integer  "guide_id"
    t.string   "language"
    t.date     "date"
    t.integer  "available"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "offers", ["excurion_id"], name: "index_offers_on_excurion_id"
  add_index "offers", ["guide_id"], name: "index_offers_on_guide_id"

  create_table "tours", force: :cascade do |t|
    t.integer  "excurion_id"
    t.integer  "guide_id"
    t.integer  "turist_id"
    t.text     "guide_point"
    t.integer  "excursion_point"
    t.text     "guide_description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "tours", ["excurion_id"], name: "index_tours_on_excurion_id"
  add_index "tours", ["guide_id"], name: "index_tours_on_guide_id"
  add_index "tours", ["turist_id"], name: "index_tours_on_turist_id"

  create_table "turists", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
