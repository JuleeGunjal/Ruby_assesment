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

ActiveRecord::Schema[7.0].define(version: 2022_12_07_084141) do
  create_table "attendances", force: :cascade do |t|
    t.string "status"
    t.string "month"
    t.time "time"
    t.integer "subjects_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "students_id"
    t.index ["students_id"], name: "index_attendances_on_students_id"
    t.index ["subjects_id"], name: "index_attendances_on_subjects_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.date "dob"
    t.string "gender"
    t.text "address"
    t.string "semister"
    t.string "course"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "sname"
    t.string "scode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "teachers_id"
    t.index ["teachers_id"], name: "index_subjects_on_teachers_id"
  end

  create_table "subjects_students", force: :cascade do |t|
    t.integer "students_id"
    t.integer "subjects_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["students_id"], name: "index_subjects_students_on_students_id"
    t.index ["subjects_id"], name: "index_subjects_students_on_subjects_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.date "dob"
    t.string "gender"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mobile_no"
  end

  add_foreign_key "attendances", "students", column: "students_id"
  add_foreign_key "attendances", "subjects", column: "subjects_id"
  add_foreign_key "subjects", "teachers", column: "teachers_id"
end
