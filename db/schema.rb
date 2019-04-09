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

ActiveRecord::Schema.define(version: 2019_04_08_222936) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "episodes", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "duration"
    t.bigint "serie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["serie_id"], name: "index_episodes_on_serie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "rating"
    t.integer "duration"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
  end

  create_table "rentals", force: :cascade do |t|
    t.integer "paid_price"
    t.string "rentable_type"
    t.bigint "rentable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rentable_type", "rentable_id"], name: "index_rentals_on_rentable_type_and_rentable_id"
  end

  create_table "series", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "rating"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
  end

  add_foreign_key "episodes", "series", column: "serie_id"
end
