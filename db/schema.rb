# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140608091716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chore_assignments", force: true do |t|
    t.integer  "user_id",                    null: false
    t.integer  "chore_id",                   null: false
    t.date     "due_date",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "completed",  default: false
  end

  add_index "chore_assignments", ["chore_id"], name: "index_chore_assignments_on_chore_id", using: :btree
  add_index "chore_assignments", ["user_id", "chore_id"], name: "index_chore_assignments_on_user_id_and_chore_id", using: :btree
  add_index "chore_assignments", ["user_id"], name: "index_chore_assignments_on_user_id", using: :btree

  create_table "chores", force: true do |t|
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "day"
    t.integer  "crew",       null: false
  end

  create_table "users", force: true do |t|
    t.string   "name",                       null: false
    t.string   "uid",                        null: false
    t.string   "email",                      null: false
    t.string   "photo",                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",      default: false, null: false
  end

  add_index "users", ["uid"], name: "index_users_on_uid", unique: true, using: :btree

end
