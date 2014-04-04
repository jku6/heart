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

ActiveRecord::Schema.define(version: 20140404023437) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "hrm_data_points", force: true do |t|
    t.integer  "hrm_session_id"
    t.integer  "beats_per_minute"
    t.date     "reading_start_time"
    t.date     "reading_end_time"
    t.integer  "duration_in_secs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hrm_data_points", ["hrm_session_id"], name: "index_hrm_data_points_on_hrm_session_id", using: :btree

  create_table "hrm_sessions", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.integer  "duration_in_secs"
    t.datetime "updated_at"
  end

  add_index "hrm_sessions", ["user_id"], name: "index_hrm_sessions_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.string   "username"
    t.string   "gender"
    t.integer  "age"
    t.integer  "hr_zone1_bpm_min"
    t.integer  "hr_zone1_bpm_max"
    t.integer  "hr_zone2_bpm_min"
    t.integer  "hr_zone2_bpm_max"
    t.integer  "hr_zone3_bpm_min"
    t.integer  "hr_zone3_bpm_max"
    t.integer  "hr_zone4_bpm_min"
    t.integer  "hr_zone4_bpm_max"
    t.datetime "updated_at"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
