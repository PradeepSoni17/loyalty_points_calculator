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

ActiveRecord::Schema.define(version: 2022_05_25_091755) do

  create_table "rewards", force: :cascade do |t|
    t.string "reward_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_rewards", force: :cascade do |t|
    t.integer "user_id"
    t.integer "reward_points"
    t.string "reward_earned"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_rewards_on_user_id"
  end

  create_table "user_transactions", force: :cascade do |t|
    t.integer "user_id"
    t.decimal "total_spends"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "currency", default: "INR"
    t.index ["user_id"], name: "index_user_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.date "date_of_birth"
    t.float "total_spends", default: 0.0
    t.integer "loyalty_points_earned", default: 0
    t.string "tier", default: "standard"
    t.string "time_zone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "user_rewards", "users"
  add_foreign_key "user_transactions", "users"
end
