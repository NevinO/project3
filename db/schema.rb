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

ActiveRecord::Schema.define(version: 20160128030151) do

  create_table "comments", force: :cascade do |t|
    t.string   "email"
    t.string   "message"
    t.string   "name"
    t.datetime "comment_date"
    t.integer  "food_id"
    t.integer  "post_id"
    t.integer  "user_id"
  end

  add_index "comments", ["food_id"], name: "index_comments_on_food_id"
  add_index "comments", ["post_id"], name: "index_comments_on_post_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "events", force: :cascade do |t|
    t.string   "header"
    t.string   "short_description"
    t.string   "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "image"
    t.integer  "user_id"
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "foods", force: :cascade do |t|
    t.integer "category"
    t.string  "header"
    t.string  "food_description"
    t.string  "short_description"
    t.string  "image"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "product_id"
    t.integer "order_id"
    t.decimal "unit_price"
    t.decimal "total_price"
    t.integer "quantity"
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id"

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "order_status"
    t.decimal "subtotal"
    t.decimal "total"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "posts", force: :cascade do |t|
    t.string   "image"
    t.string   "header"
    t.string   "short_description"
    t.string   "post_description"
    t.datetime "comment_date"
    t.integer  "user_id"
    t.integer  "post_category"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "products", force: :cascade do |t|
    t.string  "name"
    t.integer "category"
    t.float   "price"
    t.string  "product_description"
    t.string  "image_product"
    t.string  "composition"
    t.string  "recommendation_for_use"
    t.float   "grams"
    t.integer "count"
    t.boolean "sale"
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "authentication_token"
    t.string   "avatar"
    t.string   "phone"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
