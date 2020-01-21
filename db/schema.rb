# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_21_171000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
    t.boolean "super_admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "batting_performances", force: :cascade do |t|
    t.integer "runs", null: false
    t.integer "balls", null: false
    t.integer "sixes", null: false
    t.integer "fours", null: false
    t.boolean "out", default: true
    t.bigint "user_id", null: false
    t.bigint "match_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["match_id"], name: "index_batting_performances_on_match_id"
    t.index ["user_id", "match_id"], name: "uniq_user_per_match", unique: true
    t.index ["user_id"], name: "index_batting_performances_on_user_id"
  end

  create_table "bowling_performances", force: :cascade do |t|
    t.integer "overs", null: false
    t.integer "runs", null: false
    t.integer "wickets", null: false
    t.bigint "user_id", null: false
    t.bigint "match_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["match_id"], name: "index_bowling_performances_on_match_id"
    t.index ["user_id", "match_id"], name: "uniq_bowler_per_match", unique: true
    t.index ["user_id"], name: "index_bowling_performances_on_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.string "team1", null: false
    t.string "team2", null: false
    t.datetime "time", null: false
    t.string "venue", null: false
    t.string "winner"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name", null: false
    t.string "venue", null: false
    t.string "result", null: false
    t.date "date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "photo"
    t.bigint "phone"
    t.integer "passout_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
  end

end
