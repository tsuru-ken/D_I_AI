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

ActiveRecord::Schema.define(version: 2023_02_13_124743) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ai_categories", force: :cascade do |t|
    t.string "genre", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "costs", force: :cascade do |t|
    t.string "breakdown", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "document_image"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "partner_ai_category_labels", force: :cascade do |t|
    t.bigint "partner_id", null: false
    t.bigint "ai_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ai_category_id"], name: "index_partner_ai_category_labels_on_ai_category_id"
    t.index ["partner_id"], name: "index_partner_ai_category_labels_on_partner_id"
  end

  create_table "partner_cost_labels", force: :cascade do |t|
    t.bigint "partner_id", null: false
    t.bigint "cost_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cost_id"], name: "index_partner_cost_labels_on_cost_id"
    t.index ["partner_id"], name: "index_partner_cost_labels_on_partner_id"
  end

  create_table "partner_service_content_labels", force: :cascade do |t|
    t.bigint "partner_id", null: false
    t.bigint "service_content_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["partner_id"], name: "index_partner_service_content_labels_on_partner_id"
    t.index ["service_content_id"], name: "index_partner_service_content_labels_on_service_content_id"
  end

  create_table "partners", force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.text "address", null: false
    t.text "url", null: false
    t.string "established", null: false
    t.text "service"
    t.string "engineer"
    t.bigint "provision"
    t.text "product"
    t.text "case"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_partners_on_user_id"
  end

  create_table "service_contents", force: :cascade do |t|
    t.string "division", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "admin", default: false
    t.string "name", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "documents", "users"
  add_foreign_key "partner_ai_category_labels", "ai_categories"
  add_foreign_key "partner_ai_category_labels", "partners"
  add_foreign_key "partner_cost_labels", "costs"
  add_foreign_key "partner_cost_labels", "partners"
  add_foreign_key "partner_service_content_labels", "partners"
  add_foreign_key "partner_service_content_labels", "service_contents"
  add_foreign_key "partners", "users"
end
