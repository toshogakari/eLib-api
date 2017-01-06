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

ActiveRecord::Schema.define(version: 20161108015643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_cases", force: :cascade do |t|
    t.integer  "evaluation", limit: 2, default: 0, null: false
    t.integer  "level",                default: 0, null: false
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["book_id"], name: "index_book_cases_on_book_id", using: :btree
    t.index ["user_id"], name: "index_book_cases_on_user_id", using: :btree
  end

  create_table "books", force: :cascade do |t|
    t.text     "description"
    t.string   "isbn",         limit: 13,  default: "0", null: false
    t.string   "mb_image_url", limit: 512
    t.string   "pc_image_url", limit: 512
    t.string   "title",        limit: 255, default: "",  null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 45, default: "", null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "name",       limit: 255, default: "", null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "notes", force: :cascade do |t|
    t.text     "note",         default: "", null: false
    t.integer  "book_case_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["book_case_id"], name: "index_notes_on_book_case_id", using: :btree
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name",       limit: 45, default: "", null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "tag_has_books", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_tag_has_books_on_book_id", using: :btree
    t.index ["tag_id"], name: "index_tag_has_books_on_tag_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",       limit: 45, default: "", null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "user_has_skills", force: :cascade do |t|
    t.integer  "skill_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_user_has_skills_on_skill_id", using: :btree
    t.index ["user_id"], name: "index_user_has_skills_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                      default: "", null: false
    t.string   "email",                     default: "", null: false
    t.string   "password_digest",           default: "", null: false
    t.integer  "experience",      limit: 2, default: 0,  null: false
    t.text     "profile"
    t.integer  "job_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["job_id"], name: "index_users_on_job_id", using: :btree
  end

  add_foreign_key "book_cases", "books"
  add_foreign_key "book_cases", "users"
  add_foreign_key "notes", "book_cases"
  add_foreign_key "tag_has_books", "books"
  add_foreign_key "tag_has_books", "tags"
  add_foreign_key "user_has_skills", "skills"
  add_foreign_key "user_has_skills", "users"
  add_foreign_key "users", "jobs"
end
