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

ActiveRecord::Schema.define(version: 20171103055459) do

  create_table "coupons", force: :cascade do |t|
    t.string   "couponName"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "merchant_id"
  end

  add_index "coupons", ["merchant_id"], name: "index_coupons_on_merchant_id"

  create_table "friendships", force: :cascade do |t|
    t.boolean  "agreed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user1_id"
    t.integer  "user2_id"
  end

  add_index "friendships", ["user1_id"], name: "index_friendships_on_user1_id"
  add_index "friendships", ["user2_id"], name: "index_friendships_on_user2_id"

  create_table "media", force: :cascade do |t|
    t.string   "note"
    t.string   "photoUrl"
    t.string   "location"
    t.datetime "savedTime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "media", ["user_id"], name: "index_media_on_user_id"

  create_table "merchants", force: :cascade do |t|
    t.string   "merchantName",                        null: false
    t.string   "username",                            null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "location"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "merchants", ["email"], name: "index_merchants_on_email", unique: true
  add_index "merchants", ["merchantName"], name: "index_merchants_on_merchantName", unique: true
  add_index "merchants", ["reset_password_token"], name: "index_merchants_on_reset_password_token", unique: true

  create_table "saved_coupons", force: :cascade do |t|
    t.boolean  "validation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "coupon_id"
  end

  add_index "saved_coupons", ["coupon_id"], name: "index_saved_coupons_on_coupon_id"
  add_index "saved_coupons", ["user_id"], name: "index_saved_coupons_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username",                            null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "lastLocation"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
