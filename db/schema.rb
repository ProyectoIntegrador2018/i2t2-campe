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

ActiveRecord::Schema.define(version: 2019_12_02_155417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_admin"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_groups_on_name", unique: true
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "request_password_it2t2"
    t.string "creation_date"
    t.string "desc_request_status"
    t.integer "cvu"
    t.string "name"
    t.string "paternal_last_name"
    t.string "maternal_last_name"
    t.string "rfc"
    t.string "curp"
    t.string "gender"
    t.string "marital_stauts"
    t.date "birth_date"
    t.string "country_birth"
    t.string "state_birth"
    t.string "street_address"
    t.string "street_number_address_ext"
    t.string "street_number_address_int"
    t.string "colony_address"
    t.string "city_address"
    t.string "municipiality_address"
    t.string "state_address"
    t.string "phone_number"
    t.string "cell_phone"
    t.string "convocatory"
    t.integer "fiscal_year"
    t.string "studies_start_date"
    t.string "studies_end_date"
    t.string "start_scholarship"
    t.string "end_scholarship"
    t.string "school"
    t.string "entity"
    t.string "support_to_get"
    t.string "program"
    t.string "expertise_area"
    t.string "field_study"
    t.string "discipline"
    t.string "sub_discipline"
    t.decimal "last_gpa"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
