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

ActiveRecord::Schema.define(version: 2020_02_04_122834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alarms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "values", default: [], array: true
    t.text "values_short_display", default: [], array: true
    t.string "message"
    t.string "rule_name_display"
    t.string "severity"
    t.string "severity_number"
    t.datetime "entry_time"
    t.string "uuid"
    t.text "devices", default: [], array: true
    t.boolean "active", default: false
    t.string "possible_causes", default: [], array: true
    t.string "tenant"
    t.string "alarm_id"
    t.boolean "acknowledged", default: false
    t.text "consumed_events", default: [], array: true
    t.datetime "statcycletime"
    t.datetime "receive_time"
    t.string "component"
    t.string "rulename"
    t.string "alarm_type"
    t.string "eventname"
    t.datetime "cleared_time"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
