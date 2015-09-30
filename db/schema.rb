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

ActiveRecord::Schema.define(version: 20150930130439) do

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "category_name", limit: 255
    t.text     "description",   limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "city_name",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name",          limit: 255
    t.string   "last_name",           limit: 255
    t.string   "email",               limit: 255
    t.integer  "mobile",              limit: 8
    t.text     "address",             limit: 65535
    t.string   "country",             limit: 255
    t.string   "city",                limit: 255
    t.integer  "pincode",             limit: 4
    t.date     "date_of_birth"
    t.string   "password_digest",     limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "remember_digest",     limit: 255
    t.boolean  "admin",                             default: false
    t.datetime "deleted_at"
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.integer  "city_id",             limit: 4
  end

  add_index "customers", ["deleted_at"], name: "index_customers_on_deleted_at", using: :btree

  create_table "line_items", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "cart_id",    limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "quantity",   limit: 4, default: 1
    t.integer  "order_id",   limit: 4
  end

  create_table "orders", force: :cascade do |t|
    t.string   "first_name",   limit: 255
    t.string   "last_name",    limit: 255
    t.text     "address",      limit: 65535
    t.string   "email",        limit: 255
    t.string   "payment_mode", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "product_name",       limit: 255
    t.string   "brand",              limit: 255
    t.text     "description",        limit: 65535
    t.decimal  "price",                            precision: 10
    t.integer  "quantity",           limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.datetime "deleted_at"
    t.integer  "category_id",        limit: 4
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "products", ["deleted_at"], name: "index_products_on_deleted_at", using: :btree

end
