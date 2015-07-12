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

ActiveRecord::Schema.define(version: 20150712144356) do

  create_table "habilities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "password_digest",     limit: 255
    t.integer  "telephone",           limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.string   "email",               limit: 255
    t.boolean  "logged_in"
    t.string   "remember_digest",     limit: 255
  end

  create_table "valorations", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "hability_id", limit: 4
    t.integer  "points",      limit: 4
    t.datetime "date"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "valorations", ["hability_id"], name: "index_valorations_on_hability_id", using: :btree
  add_index "valorations", ["user_id"], name: "index_valorations_on_user_id", using: :btree

  add_foreign_key "valorations", "habilities"
  add_foreign_key "valorations", "users"
end
