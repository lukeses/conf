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

ActiveRecord::Schema.define(version: 20150119213743) do

  create_table "attachments", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachments", ["task_id"], name: "index_attachments_on_task_id", using: :btree

  create_table "event_organisers", force: true do |t|
    t.integer  "event_id"
    t.integer  "organiser_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_organisers", ["event_id"], name: "index_event_organisers_on_event_id", using: :btree
  add_index "event_organisers", ["organiser_id"], name: "index_event_organisers_on_organiser_id", using: :btree

  create_table "events", force: true do |t|
    t.date     "start_date"
    t.string   "kind"
    t.string   "type"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organisers", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "skype"
    t.text     "description"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organisers", ["event_id"], name: "index_organisers_on_event_id", using: :btree

  create_table "participants", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "skype"
    t.boolean  "is_paid"
    t.boolean  "is_guest"
    t.text     "description"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "participants", ["event_id"], name: "index_participants_on_event_id", using: :btree

  create_table "speakers", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.text     "description"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "speakers", ["event_id"], name: "index_speakers_on_event_id", using: :btree

  create_table "sponsors", force: true do |t|
    t.string   "name"
    t.string   "form"
    t.decimal  "amount",      precision: 10, scale: 0
    t.text     "description"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sponsors", ["event_id"], name: "index_sponsors_on_event_id", using: :btree

  create_table "tasks", force: true do |t|
    t.string   "name"
    t.datetime "end_date"
    t.datetime "reminder"
    t.integer  "sponsor_id"
    t.integer  "organiser_id"
    t.integer  "speaker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
  end

  add_index "tasks", ["event_id"], name: "index_tasks_on_event_id", using: :btree
  add_index "tasks", ["organiser_id"], name: "index_tasks_on_organiser_id", using: :btree
  add_index "tasks", ["speaker_id"], name: "index_tasks_on_speaker_id", using: :btree
  add_index "tasks", ["sponsor_id"], name: "index_tasks_on_sponsor_id", using: :btree

end
