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

ActiveRecord::Schema.define(version: 20170723170056) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "route_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_comments_on_route_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "region"
    t.string "city"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pitches", force: :cascade do |t|
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qualities", force: :cascade do |t|
    t.integer "star_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.string "route_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "rating_id"
    t.bigint "pitch_id"
    t.bigint "location_id"
    t.text "description"
    t.index ["location_id"], name: "index_routes_on_location_id"
    t.index ["pitch_id"], name: "index_routes_on_pitch_id"
    t.index ["rating_id"], name: "index_routes_on_rating_id"
  end

  create_table "routesqualities", force: :cascade do |t|
    t.bigint "route_id"
    t.bigint "quality_id"
    t.float "average_quality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "star_count"
    t.index ["quality_id"], name: "index_routesqualities_on_quality_id"
    t.index ["route_id"], name: "index_routesqualities_on_route_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.integer "role", default: 0
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_routes", force: :cascade do |t|
    t.bigint "route_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_users_routes_on_route_id"
    t.index ["user_id"], name: "index_users_routes_on_user_id"
  end

  add_foreign_key "comments", "routes"
  add_foreign_key "comments", "users"
  add_foreign_key "routes", "locations"
  add_foreign_key "routes", "pitches"
  add_foreign_key "routes", "ratings"
  add_foreign_key "routesqualities", "qualities"
  add_foreign_key "routesqualities", "routes"
  add_foreign_key "users_routes", "routes"
  add_foreign_key "users_routes", "users"
end
