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

ActiveRecord::Schema.define(version: 2020_04_30_002042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

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

  create_table "certifications", force: :cascade do |t|
    t.bigint "curriculum_id"
    t.string "emitting_organization"
    t.string "certification_name"
    t.date "date_emitted"
    t.string "brief_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curriculum_id"], name: "index_certifications_on_curriculum_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.text "information"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "curriculums", force: :cascade do |t|
    t.bigint "student_id"
    t.text "professional_objective"
    t.integer "min_desired_salary"
    t.integer "max_desired_salary"
    t.string "desired_position"
    t.text "skils"
    t.text "areas_of_expertise"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_curriculums_on_student_id"
  end

  create_table "education_histories", force: :cascade do |t|
    t.bigint "curriculum_id"
    t.date "start_date"
    t.date "end_date"
    t.string "area_of_study"
    t.string "university"
    t.string "brief_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curriculum_id"], name: "index_education_histories_on_curriculum_id"
  end

  create_table "job_postings", force: :cascade do |t|
    t.string "title"
    t.integer "salary"
    t.text "description"
    t.integer "number_positions"
    t.string "keywords"
    t.string "employment_type"
    t.text "responsabilities"
    t.string "experience_required"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.bigint "curriculum_id"
    t.string "language_name"
    t.integer "proficiency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curriculum_id"], name: "index_languages_on_curriculum_id"
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

  create_table "work_experiences", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "company_id", null: false
    t.string "entity"
    t.string "country"
    t.string "title"
    t.string "study_area"
    t.integer "degree_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_work_experiences_on_company_id"
    t.index ["student_id"], name: "index_work_experiences_on_student_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "certifications", "curriculums"
  add_foreign_key "curriculums", "students"
  add_foreign_key "education_histories", "curriculums"
  add_foreign_key "languages", "curriculums"
  add_foreign_key "work_experiences", "companies"
  add_foreign_key "work_experiences", "students"
end
