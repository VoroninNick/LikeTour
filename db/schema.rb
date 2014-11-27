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

ActiveRecord::Schema.define(version: 20141127151014) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.string   "slug"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_translations", force: true do |t|
    t.integer  "category_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "slug"
    t.text     "description"
  end

  add_index "category_translations", ["category_id"], name: "index_category_translations_on_category_id"
  add_index "category_translations", ["locale"], name: "index_category_translations_on_locale"

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

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "photo_galleries", force: true do |t|
    t.string   "title"
    t.string   "alt"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photo_gallery_translations", force: true do |t|
    t.integer  "photo_gallery_id", null: false
    t.string   "locale",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "alt"
  end

  add_index "photo_gallery_translations", ["locale"], name: "index_photo_gallery_translations_on_locale"
  add_index "photo_gallery_translations", ["photo_gallery_id"], name: "index_photo_gallery_translations_on_photo_gallery_id"

  create_table "tour_translations", force: true do |t|
    t.integer  "tour_id",           null: false
    t.string   "locale",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "slug"
    t.text     "description"
    t.text     "short_description"
    t.string   "city"
  end

  add_index "tour_translations", ["locale"], name: "index_tour_translations_on_locale"
  add_index "tour_translations", ["tour_id"], name: "index_tour_translations_on_tour_id"

  create_table "tours", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "short_description"
    t.text     "description"
    t.float    "price"
    t.string   "city"
    t.datetime "date_begin"
    t.datetime "date_end"
    t.integer  "category_id"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
