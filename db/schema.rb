# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_18_153514) do

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "people", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "document_number"
    t.string "direction"
    t.integer "phone"
    t.integer "card"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_people_on_user_id"
  end

  create_table "rents", force: :cascade do |t|
    t.integer "vehicle_id", null: false
    t.integer "person_id", null: false
    t.date "begins_at"
    t.date "ends_at"
    t.string "pay"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_rents_on_person_id"
    t.index ["vehicle_id"], name: "index_rents_on_vehicle_id"
  end

  create_table "services", force: :cascade do |t|
    t.integer "vehicle_id", null: false
    t.text "description"
    t.integer "kilometres"
    t.date "begins_at"
    t.date "ends_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vehicle_id"], name: "index_services_on_vehicle_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer "category_id", null: false
    t.string "patent"
    t.string "model"
    t.string "fuel"
    t.integer "kilometres"
    t.integer "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "brand_id", null: false
    t.index ["brand_id"], name: "index_vehicles_on_brand_id"
    t.index ["category_id"], name: "index_vehicles_on_category_id"
  end

  add_foreign_key "people", "users"
  add_foreign_key "rents", "people"
  add_foreign_key "rents", "vehicles"
  add_foreign_key "services", "vehicles"
  add_foreign_key "vehicles", "brands"
  add_foreign_key "vehicles", "categories"
end
