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

ActiveRecord::Schema.define(version: 2020_10_19_002744) do

  create_table "properties", force: :cascade do |t|
    t.integer "landlord_id", null: false
    t.integer "tenant_id"
    t.string "address", null: false
    t.integer "rooms", null: false
    t.integer "bathrooms", null: false
    t.integer "squarefeet", null: false
    t.integer "storeys", null: false
    t.integer "rent", null: false
    t.text "description"
    t.boolean "available", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["landlord_id"], name: "index_properties_on_landlord_id"
    t.index ["tenant_id"], name: "index_properties_on_tenant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "properties", "users", column: "landlord_id"
  add_foreign_key "properties", "users", column: "tenant_id"
end
