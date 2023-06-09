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

ActiveRecord::Schema[7.0].define(version: 2023_06_06_164952) do
  create_table "contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.text "description"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "interview_id"
    t.index ["interview_id"], name: "index_contacts_on_interview_id"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "interviews", force: :cascade do |t|
    t.date "date"
    t.string "format"
    t.string "interview_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "job_id"
    t.index ["job_id"], name: "index_interviews_on_job_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.string "company"
    t.string "location"
    t.text "description"
    t.date "date_applied"
    t.string "status", default: "bookmarked"
    t.integer "min_salary"
    t.integer "max_salary"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pay_period", default: "Yr"
    t.date "follow_up_date"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "job_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_notes_on_job_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "application_goal", default: 5
    t.integer "salary_min", default: 0
    t.integer "salary_max", default: 0
    t.string "target_title"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "contacts", "interviews"
  add_foreign_key "contacts", "users"
  add_foreign_key "interviews", "jobs"
  add_foreign_key "jobs", "users"
  add_foreign_key "notes", "jobs"
end
