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

ActiveRecord::Schema.define(version: 2018_10_04_232218) do

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "kategoria"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "article_id"
    t.string "name"
    t.string "email"
    t.text "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "ip"
  end

  create_table "newsletters", force: :cascade do |t|
    t.string "email"
    t.string "kod_dostepu"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visit_details", force: :cascade do |t|
    t.integer "visit_id"
    t.string "ip_address", limit: 15
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ip_address"], name: "index_visit_details_on_ip_address"
    t.index ["visit_id"], name: "index_visit_details_on_visit_id"
  end

  create_table "visits", force: :cascade do |t|
    t.integer "visitable_id"
    t.string "visitable_type", limit: 30
    t.integer "total_visits"
    t.integer "unique_visits"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["visitable_id"], name: "index_visits_on_visitable_id"
    t.index ["visitable_type"], name: "index_visits_on_visitable_type"
  end

end
