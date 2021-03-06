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

ActiveRecord::Schema.define(:version => 20110529085552) do

  create_table "answers", :force => true do |t|
    t.string  "answer"
    t.integer "question_id"
    t.integer "index"
  end

  create_table "comments", :force => true do |t|
    t.integer  "poll_id"
    t.integer  "user_id"
    t.string   "comment"
    t.datetime "created_at"
  end

  create_table "feature_requests", :force => true do |t|
    t.string   "feature"
    t.datetime "created_at"
    t.integer  "user_id"
  end

  create_table "polls", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.string   "question"
    t.integer  "poll_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "index"
  end

  create_table "responses", :force => true do |t|
    t.integer "user_id"
    t.integer "answer_id"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "email",                               :default => "", :null => false
  end

  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
