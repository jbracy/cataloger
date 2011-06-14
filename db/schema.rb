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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110614025432) do

  create_table "catalogs", :force => true do |t|
    t.integer  "user_id"
    t.string   "title",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "catalogs", ["user_id"], :name => "index_catalogs_on_user_id"

  create_table "categories", :force => true do |t|
    t.integer  "catalog_id", :null => false
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["catalog_id", "id"], :name => "index_categories_on_catalog_id_and_id", :unique => true
  add_index "categories", ["name"], :name => "index_categories_on_name", :unique => true

  create_table "categorizations", :force => true do |t|
    t.integer  "category_id", :null => false
    t.integer  "product_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categorizations", ["category_id", "product_id"], :name => "index_categorizations_on_category_id_and_product_id", :unique => true

  create_table "products", :force => true do |t|
    t.integer  "catalog_id",         :null => false
    t.string   "sku"
    t.string   "name"
    t.integer  "price"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["catalog_id", "id"], :name => "index_products_on_catalog_id_and_id", :unique => true
  add_index "products", ["catalog_id", "sku"], :name => "index_products_on_catalog_id_and_sku", :unique => true

  create_table "users", :force => true do |t|
    t.string   "username",            :null => false
    t.string   "email",               :null => false
    t.string   "crypted_password",    :null => false
    t.string   "password_salt",       :null => false
    t.string   "persistence_token",   :null => false
    t.string   "single_access_token", :null => false
    t.string   "perishable_token",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token", :unique => true
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token", :unique => true
  add_index "users", ["single_access_token"], :name => "index_users_on_single_access_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
