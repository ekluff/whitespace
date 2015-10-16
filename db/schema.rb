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

ActiveRecord::Schema.define(version: 20151016001237) do

  create_table "exifs", force: :cascade do |t|
    t.string   "camera"
    t.string   "software"
    t.integer  "iso"
    t.string   "shutter"
    t.string   "aperture"
    t.datetime "taken"
    t.string   "exposure_bias"
    t.boolean  "flash"
    t.string   "focal_length"
    t.integer  "image_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "exifs", ["aperture"], name: "index_exifs_on_aperture"
  add_index "exifs", ["camera"], name: "index_exifs_on_camera"
  add_index "exifs", ["exposure_bias"], name: "index_exifs_on_exposure_bias"
  add_index "exifs", ["flash"], name: "index_exifs_on_flash"
  add_index "exifs", ["focal_length"], name: "index_exifs_on_focal_length"
  add_index "exifs", ["image_id"], name: "index_exifs_on_image_id"
  add_index "exifs", ["iso"], name: "index_exifs_on_iso"
  add_index "exifs", ["shutter"], name: "index_exifs_on_shutter"
  add_index "exifs", ["software"], name: "index_exifs_on_software"
  add_index "exifs", ["taken"], name: "index_exifs_on_taken"

  create_table "images", force: :cascade do |t|
    t.string   "caption"
    t.string   "title"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
  end

end
