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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121023155619) do

  create_table "agencies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "agencies", ["name"], :name => "index_agencies_on_name"

  create_table "contracts", :force => true do |t|
    t.integer  "agency_id"
    t.integer  "vendor_id"
    t.string   "uri"
    t.string   "reference_number"
    t.date     "contract_date"
    t.date     "delivery_date"
    t.string   "description"
    t.string   "contract_period"
    t.float    "contract_value"
    t.text     "comments"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "vendors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "vendors", ["name"], :name => "index_vendors_on_name"

  add_foreign_key "contracts", "agencies", :name => "contracts_agency_id_fk"
  add_foreign_key "contracts", "vendors", :name => "contracts_vendor_id_fk"

end
