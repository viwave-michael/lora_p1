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

ActiveRecord::Schema.define(version: 20151108054626) do

  create_table "devices", force: :cascade do |t|
    t.string   "serial"
    t.string   "capability"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices_groups", id: false, force: :cascade do |t|
    t.integer "device_id"
    t.integer "group_id"
  end

  add_index "devices_groups", ["device_id"], name: "index_devices_groups_on_device_id"
  add_index "devices_groups", ["group_id"], name: "index_devices_groups_on_group_id"

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "paths", force: :cascade do |t|
    t.integer  "device_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "paths", ["device_id"], name: "index_paths_on_device_id"

  create_table "positions", force: :cascade do |t|
    t.integer  "path_id"
    t.datetime "when"
    t.float    "lng"
    t.float    "lat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "positions", ["path_id"], name: "index_positions_on_path_id"

  create_table "roll_call_answers", force: :cascade do |t|
    t.integer  "roll_call_id"
    t.integer  "device_id"
    t.datetime "when"
    t.float    "lng"
    t.float    "lat"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "roll_call_answers", ["device_id"], name: "index_roll_call_answers_on_device_id"
  add_index "roll_call_answers", ["roll_call_id"], name: "index_roll_call_answers_on_roll_call_id"

  create_table "roll_calls", force: :cascade do |t|
    t.integer  "device_id"
    t.datetime "when"
    t.float    "lng"
    t.float    "lat"
    t.boolean  "manual"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "roll_calls", ["device_id"], name: "index_roll_calls_on_device_id"

end
