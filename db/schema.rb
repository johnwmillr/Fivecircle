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

ActiveRecord::Schema.define(version: 20171026014928) do

  create_table "coupons", force: :cascade do |t|
    t.string   "CouponName"
    t.string   "Description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "merchant_id"
    t.index ["merchant_id"], name: "index_coupons_on_merchant_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.boolean  "Agreed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user1_id"
    t.integer  "user2_id"
    t.index ["user1_id"], name: "index_friendships_on_user1_id"
    t.index ["user2_id"], name: "index_friendships_on_user2_id"
  end

  create_table "media", force: :cascade do |t|
    t.string   "Note"
    t.string   "PhotoUrl"
    t.string   "Location"
    t.datetime "SavedTime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_media_on_user_id"
  end

  create_table "merchants", force: :cascade do |t|
    t.string   "MerchantName"
    t.string   "Username"
    t.string   "Email"
    t.string   "Password"
    t.string   "Location"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "saved_coupons", force: :cascade do |t|
    t.boolean  "Valid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "coupon_id"
    t.index ["coupon_id"], name: "index_saved_coupons_on_coupon_id"
    t.index ["user_id"], name: "index_saved_coupons_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "Username"
    t.string   "Email"
    t.string   "Password"
    t.string   "LastLocation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
