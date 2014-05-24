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

ActiveRecord::Schema.define(version: 20140523170013) do

  create_table "bookings", force: true do |t|
    t.integer  "user_id"
    t.integer  "driver_id"
    t.text     "origin"
    t.text     "destination"
    t.decimal  "estimated_cost", precision: 10, scale: 0
    t.string   "pickup_time"
    t.date     "pickup_date"
    t.text     "notes"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bookings", ["driver_id"], name: "index_bookings_on_driver_id", using: :btree
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id", using: :btree

  create_table "drivers", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "mobileno"
    t.float    "longitude"
    t.float    "latitude"
    t.integer  "status",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "drivers", ["mobileno", "status"], name: "index_drivers_on_mobileno_and_status", using: :btree

  create_table "passwords", force: true do |t|
    t.integer  "user_id"
    t.string   "password"
    t.string   "token"
    t.date     "sent_at"
    t.date     "used_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "mobileno"
    t.string   "password"
    t.integer  "status",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["mobileno"], name: "index_users_on_mobileno", using: :btree

end
