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

ActiveRecord::Schema.define(:version => 20130601142353) do

  create_table "opro_auth_grants", :force => true do |t|
    t.string   "code"
    t.string   "access_token"
    t.string   "refresh_token"
    t.text     "permissions"
    t.datetime "access_token_expires_at"
    t.integer  "user_id"
    t.integer  "application_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "opro_auth_grants", ["access_token"], :name => "index_opro_auth_grants_on_access_token", :unique => true
  add_index "opro_auth_grants", ["code"], :name => "index_opro_auth_grants_on_code", :unique => true
  add_index "opro_auth_grants", ["refresh_token"], :name => "index_opro_auth_grants_on_refresh_token", :unique => true

  create_table "opro_client_apps", :force => true do |t|
    t.string   "name"
    t.string   "app_id"
    t.string   "app_secret"
    t.text     "permissions"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "opro_client_apps", ["app_id", "app_secret"], :name => "index_opro_client_apps_on_app_id_and_app_secret", :unique => true
  add_index "opro_client_apps", ["app_id"], :name => "index_opro_client_apps_on_app_id", :unique => true

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
    t.datetime "global_time"
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
