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

ActiveRecord::Schema.define(version: 2020_07_26_102114) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "title", null: false
    t.integer "students_count", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "closest_starting_group_id"
    t.index ["closest_starting_group_id"], name: "index_courses_on_closest_starting_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.datetime "start_at", null: false
    t.integer "students_count", default: 0, null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_groups_on_course_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.bigint "group_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_students_on_course_id"
    t.index ["email", "group_id"], name: "index_students_on_email_and_group_id", unique: true
    t.index ["group_id"], name: "index_students_on_group_id"
  end

  add_foreign_key "courses", "groups", column: "closest_starting_group_id"
  add_foreign_key "groups", "courses"
  add_foreign_key "students", "courses"
  add_foreign_key "students", "groups"
end
