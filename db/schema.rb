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

ActiveRecord::Schema.define(version: 20150601144238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "request_records", force: :cascade do |t|
    t.string   "token"
    t.string   "service_id"
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "requests", force: :cascade do |t|
    t.string "Creation Date"
    t.string "Status"
    t.string "Completion Date"
    t.string "Service Request Number"
    t.string "Type of Service Request"
    t.string "Street Address"
    t.string "ZIP Code"
    t.string "Latitude"
    t.string "Longitude"
    t.string "Location"
    t.string "description"
    t.string "where_located"
  end

end
