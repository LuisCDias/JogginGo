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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130305140302) do

  create_table "points", :force => true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "track_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "address"
  end

  create_table "timings", :force => true do |t|
    t.datetime "initial_time"
    t.datetime "final_time"
    t.string   "global_time"
    t.integer  "user_id"
    t.integer  "track_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "tracks", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "country"
    t.integer  "user_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.boolean  "private",    :default => true
    t.boolean  "approved",   :default => true
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "username"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "admin",           :default => false
  end

end
