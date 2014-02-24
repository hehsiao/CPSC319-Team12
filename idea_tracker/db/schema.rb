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

ActiveRecord::Schema.define(version: 20140223201026) do

  create_table "categories", force: true do |t|
    t.integer  "idea_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["idea_id"], name: "index_categories_on_idea_id", using: :btree

  create_table "clients", force: true do |t|
    t.string   "c_name"
    t.string   "c_email"
    t.integer  "c_phone_num"
    t.string   "taker"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "idea_id"
    t.integer  "user_id"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["idea_id"], name: "index_comments_on_idea_id", using: :btree

  create_table "ideas", force: true do |t|
    t.integer  "client_id"
    t.integer  "user_id"
    t.integer  "comment_id"
    t.integer  "category_id"
    t.integer  "tag_association_id"
    t.integer  "tag_subscription_id"
    t.integer  "tag_keyword_id"
    t.string   "title"
    t.string   "details"
    t.string   "reference_source"
    t.string   "status"
    t.string   "taker_name"
    t.string   "taker_email"
    t.integer  "taker_phone_num"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ideas", ["category_id"], name: "index_ideas_on_category_id", using: :btree
  add_index "ideas", ["client_id"], name: "index_ideas_on_client_id", using: :btree
  add_index "ideas", ["comment_id"], name: "index_ideas_on_comment_id", using: :btree
  add_index "ideas", ["tag_association_id"], name: "index_ideas_on_tag_association_id", using: :btree
  add_index "ideas", ["tag_keyword_id"], name: "index_ideas_on_tag_keyword_id", using: :btree
  add_index "ideas", ["tag_subscription_id"], name: "index_ideas_on_tag_subscription_id", using: :btree
  add_index "ideas", ["user_id"], name: "index_ideas_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
