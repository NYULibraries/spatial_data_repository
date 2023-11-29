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

ActiveRecord::Schema[7.0].define(version: 2015_11_06_235853) do
  create_table "bookmarks", force: :cascade do |t|
    t.integer "user_id", limit: 4, null: false
    t.string "user_type", limit: 255
    t.string "document_id", limit: 255
    t.string "title", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "document_type", limit: 255
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "searches", force: :cascade do |t|
    t.text "query_params", limit: 65535
    t.integer "user_id", limit: 4
    t.string "user_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_searches_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", limit: 4, default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "guest", default: false
    t.string "provider", limit: 255, default: "", null: false
    t.string "aleph_id", limit: 255
    t.string "institution_code", limit: 255
    t.string "patron_status", limit: 255
    t.string "username", limit: 255, default: "", null: false
    t.string "firstname", limit: 255
    t.string "lastname", limit: 255
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username", "provider"], name: "index_users_on_username_and_provider", unique: true
  end

end
