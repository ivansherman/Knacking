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

ActiveRecord::Schema.define(version: 20150311153872) do

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "parent_ids", default: "[]"
    t.text     "child_ids",  default: "[]"
    t.integer  "owner_id"
    t.string   "owner_type"
  end

  create_table "communities", force: :cascade do |t|
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "owner_id"
    t.string   "default_user_access", default: "w"
    t.boolean  "public",              default: true
    t.integer  "user_count",          default: 1
    t.integer  "writer_count",        default: 1
    t.integer  "admin_count",         default: 1
    t.integer  "muted_count",         default: 0
    t.integer  "banned_count",        default: 0
    t.integer  "invitation_count",    default: 0
  end

  create_table "inkwell_blog_item_categories", force: :cascade do |t|
    t.integer  "blog_item_id"
    t.integer  "category_id"
    t.integer  "item_id"
    t.string   "item_type"
    t.datetime "blog_item_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inkwell_blog_items", force: :cascade do |t|
    t.integer  "item_id"
    t.boolean  "is_reblog"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
    t.string   "item_type"
    t.string   "owner_type"
    t.text     "category_ids", default: "[]"
  end

  create_table "inkwell_comments", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "body"
    t.integer  "parent_comment_id"
    t.integer  "topmost_obj_id"
    t.text     "upper_comments_tree"
    t.text     "users_ids_who_favorite_it", default: "[]"
    t.text     "users_ids_who_comment_it",  default: "[]"
    t.text     "users_ids_who_reblog_it",   default: "[]"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "topmost_obj_type"
  end

  create_table "inkwell_community_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "community_id"
    t.string   "user_access",      default: "r"
    t.boolean  "is_admin",         default: false
    t.integer  "admin_level"
    t.boolean  "muted",            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",           default: false
    t.boolean  "banned",           default: false
    t.boolean  "asked_invitation", default: false
  end

  create_table "inkwell_favorite_items", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "item_type"
    t.string   "owner_type"
  end

  create_table "inkwell_followings", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inkwell_timeline_items", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "owner_id"
    t.text     "from_source",      default: "[]"
    t.boolean  "has_many_sources", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "item_type"
    t.string   "owner_type"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.text     "users_ids_who_favorite_it", default: "[]"
    t.text     "users_ids_who_comment_it",  default: "[]"
    t.text     "users_ids_who_reblog_it",   default: "[]"
    t.text     "communities_ids",           default: "[]"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "follower_count",         default: 0
    t.integer  "following_count",        default: 0
    t.integer  "community_count",        default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
