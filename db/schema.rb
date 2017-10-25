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

ActiveRecord::Schema.define(version: 20171025071816) do

  create_table "coupons", primary_key: "CouponId", force: :cascade do |t|
    t.integer  "MerchantId"
    t.string   "CouponName"
    t.string   "Description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "friendships", primary_key: "FriendshipId", force: :cascade do |t|
    t.integer  "UserId1"
    t.integer  "UserId2"
    t.boolean  "Agreed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "media", primary_key: "MediaId", force: :cascade do |t|
    t.integer  "UserId"
    t.string   "Note"
    t.string   "PhotoUrl"
    t.string   "Location"
    t.datetime "TimeSaved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "merchants", primary_key: "MerchantId", force: :cascade do |t|
    t.string   "MerchantName"
    t.string   "Username"
    t.string   "Email"
    t.string   "Password"
    t.string   "Location"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "savedcoupons", primary_key: "SavedCouponId", force: :cascade do |t|
    t.integer  "CouponId"
    t.integer  "UserId"
    t.boolean  "Valid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", primary_key: "UserId", force: :cascade do |t|
    t.string   "Username"
    t.string   "Email"
    t.string   "Password"
    t.string   "CurrentLocation"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
