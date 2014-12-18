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

ActiveRecord::Schema.define(version: 20141218034627) do

  create_table "activities", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.decimal  "price",       precision: 10, scale: 2
    t.integer  "shop_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admins", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rank",        default: 0
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "comments", force: true do |t|
    t.string   "content"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "information", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
    t.boolean  "publish",                                                     default: true
    t.decimal  "price",                              precision: 10, scale: 2
    t.string   "contact"
    t.string   "mobile_number"
    t.string   "qq"
    t.string   "weixin"
    t.string   "owner_type",                                                  default: "User"
    t.integer  "category_id"
    t.integer  "visit_count",                                                 default: 0
    t.datetime "synchronized_at",                                             default: '2014-12-02 09:43:51'
    t.integer  "cached_votes_total",                                          default: 0
    t.integer  "cached_votes_score",                                          default: 0
    t.integer  "cached_votes_up",                                             default: 0
    t.integer  "cached_votes_down",                                           default: 0
    t.integer  "cached_weighted_score",                                       default: 0
    t.integer  "cached_weighted_total",                                       default: 0
    t.float    "cached_weighted_average", limit: 24,                          default: 0.0
  end

  add_index "information", ["cached_votes_down"], name: "index_information_on_cached_votes_down", using: :btree
  add_index "information", ["cached_votes_score"], name: "index_information_on_cached_votes_score", using: :btree
  add_index "information", ["cached_votes_total"], name: "index_information_on_cached_votes_total", using: :btree
  add_index "information", ["cached_votes_up"], name: "index_information_on_cached_votes_up", using: :btree
  add_index "information", ["cached_weighted_average"], name: "index_information_on_cached_weighted_average", using: :btree
  add_index "information", ["cached_weighted_score"], name: "index_information_on_cached_weighted_score", using: :btree
  add_index "information", ["cached_weighted_total"], name: "index_information_on_cached_weighted_total", using: :btree
  add_index "information", ["synchronized_at"], name: "index_information_on_synchronized_at", using: :btree
  add_index "information", ["updated_at"], name: "index_information_on_updated_at", using: :btree

  create_table "photos", force: true do |t|
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shops", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
    t.string   "contact"
    t.string   "phone"
    t.string   "url"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "qq"
    t.string   "weixin"
    t.string   "mobile_number"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end
