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

ActiveRecord::Schema.define(version: 20151231142546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.integer  "itemId"
    t.string   "player"
    t.string   "brand"
    t.string   "subbrand"
    t.integer  "year"
    t.string   "title"
    t.integer  "categoryId"
    t.string   "categoryName"
    t.string   "currency"
    t.float    "price"
    t.float    "gradeNumber"
    t.string   "gradeCompany"
    t.string   "url"
    t.string   "imageUrl"
    t.boolean  "rookie"
    t.float    "pricestart"
    t.float    "priceend"
    t.integer  "numberBids"
    t.string   "sellingState"
    t.date     "startTime"
    t.date     "endTime"
    t.string   "listingType"
    t.integer  "conditionId"
    t.string   "conditionDisplayName"
    t.string   "sellername"
    t.string   "condition"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id"
    t.string   "search_query"
    t.integer  "search_query_id"
    t.boolean  "butItNowAvailable"
    t.boolean  "bestOfferEnabled"
  end

  create_table "search_queries", force: :cascade do |t|
    t.string   "search_query"
    t.integer  "user_id"
    t.string   "player"
    t.integer  "year"
    t.string   "manufacturer"
    t.string   "grade_company"
    t.integer  "grade"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "auth_token"
  end

end
