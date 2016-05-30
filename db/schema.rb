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

ActiveRecord::Schema.define(version: 20160530013346) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hits", force: :cascade do |t|
    t.string   "location"
    t.string   "ip"
    t.string   "device"
    t.integer  "hitable_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "hitable_type"
  end

  add_index "hits", ["hitable_id"], name: "index_hits_on_hitable_id", using: :btree
  add_index "hits", ["ip"], name: "index_hits_on_ip", using: :btree

  create_table "nodes", force: :cascade do |t|
    t.string   "short_url",    null: false
    t.string   "redirect_url", null: false
    t.integer  "user_id",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "nodes", ["short_url"], name: "index_nodes_on_short_url", unique: true, using: :btree
  add_index "nodes", ["user_id"], name: "index_nodes_on_user_id", using: :btree

  create_table "pixels", force: :cascade do |t|
    t.string   "short_url",   null: false
    t.integer  "user_id",     null: false
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "pixels", ["short_url"], name: "index_pixels_on_short_url", unique: true, using: :btree
  add_index "pixels", ["user_id"], name: "index_pixels_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "session_token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["session_token"], name: "index_users_on_session_token", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
