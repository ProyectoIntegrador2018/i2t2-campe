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

ActiveRecord::Schema.define(version: 2020_04_04_014319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.jsonb "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id", "version"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "contact_informations", force: :cascade do |t|
    t.string "street_address"
    t.string "street_number_address_ext"
    t.string "street_number_address_int"
    t.string "neighborhood"
    t.string "city"
    t.string "municipality"
    t.string "state"
    t.string "phone_number"
    t.string "cellphone_number"
    t.integer "student_id"
  end

  create_table "scholarship_oportunities", force: :cascade do |t|
    t.string "name"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scholarships", force: :cascade do |t|
    t.integer "student_id"
    t.integer "scholarship_oportunity_id"
    t.integer "status"
    t.string "application_id"
    t.datetime "fiscal_year"
    t.datetime "creation_date"
    t.datetime "studies_start"
    t.datetime "studies_end"
    t.datetime "start"
    t.datetime "end"
    t.string "institution"
    t.string "entity"
    t.string "desired_support"
    t.string "program"
    t.string "study_field"
    t.string "study_area"
    t.string "discipline"
    t.string "sub_discipline"
    t.integer "degree_level"
    t.decimal "most_recent_gpa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.integer "cvu"
    t.string "name"
    t.string "paternal_last_name"
    t.string "maternal_last_name"
    t.string "rfc"
    t.string "curp"
    t.string "gender"
    t.string "marital_status"
    t.date "birth_date"
    t.string "country_birth"
    t.string "state_birth"
    t.string "degree_level"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
