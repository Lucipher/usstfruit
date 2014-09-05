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

ActiveRecord::Schema.define(version: 20140905160038) do

  create_table "article_cates", force: true do |t|
    t.string   "name"
    t.string   "no"
    t.string   "keywords"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", force: true do |t|
    t.string   "cover"
    t.text     "content",         limit: 2147483647
    t.string   "title"
    t.string   "keywords"
    t.string   "breif"
    t.integer  "article_cate_id"
    t.boolean  "hidden",                             default: true
    t.datetime "post_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cart_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.string   "no"
    t.string   "name"
    t.integer  "point"
    t.decimal  "price",      precision: 20, scale: 2, default: 0.0
    t.integer  "quantity"
    t.decimal  "amount",     precision: 20, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", force: true do |t|
    t.integer  "weixin_user_id"
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_cates", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "no"
    t.string   "cover"
    t.string   "name"
    t.integer  "product_cate_id"
    t.text     "brief"
    t.text     "content",         limit: 2147483647
    t.string   "unit"
    t.string   "keywords"
    t.boolean  "on_sale",                                                     default: true
    t.decimal  "mk_price",                           precision: 20, scale: 2, default: 0.0
    t.decimal  "price",                              precision: 20, scale: 2, default: 0.0
    t.integer  "point",                                                       default: 0
    t.integer  "store",                                                       default: 0
    t.integer  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shopping_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "shopping_id"
    t.string   "no"
    t.string   "name"
    t.integer  "point"
    t.integer  "unit"
    t.decimal  "price",       precision: 20, scale: 2, default: 0.0
    t.integer  "quantity"
    t.decimal  "amount",      precision: 20, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shoppings", force: true do |t|
    t.integer  "cart_id"
    t.string   "status"
    t.string   "pay_status"
    t.string   "ship_status"
    t.string   "ship"
    t.string   "payment"
    t.integer  "quantity"
    t.integer  "weixin_user_id"
    t.string   "customer_name"
    t.string   "customer_address"
    t.string   "mobile"
    t.text     "remark"
    t.datetime "ship_time"
    t.decimal  "cost_item",        precision: 20, scale: 2, default: 0.0
    t.decimal  "cost_ship",        precision: 20, scale: 2, default: 0.0
    t.decimal  "amount",           precision: 20, scale: 2, default: 0.0
    t.datetime "closed_at"
    t.integer  "closed_user_id"
    t.datetime "canceled_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weixin_users", force: true do |t|
    t.string   "open_id"
    t.string   "username"
    t.string   "role"
    t.string   "phone"
    t.string   "address"
    t.string   "status"
    t.datetime "closed_at"
    t.datetime "subcribled_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
