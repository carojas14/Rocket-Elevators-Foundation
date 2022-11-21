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

ActiveRecord::Schema.define(version: 2022_11_16_181634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dim_customers", force: :cascade do |t|
    t.datetime "creation_date", null: false
    t.string "compagny_name", null: false
    t.string "full_name_contact", null: false
    t.string "email", null: false
    t.integer "nb_elevator", null: false
    t.string "city", null: false
  end

  create_table "fact_contacts", force: :cascade do |t|
    t.integer "contact_id", null: false
    t.datetime "creation_date", null: false
    t.string "compagny_name", null: false
    t.string "email", null: false
    t.string "name_project", null: false
  end

  create_table "fact_elevators", force: :cascade do |t|
    t.integer "serial_number", null: false
    t.datetime "date_commissioning", null: false
    t.bigint "building_id", null: false
    t.bigint "customer_id", null: false
    t.string "city", null: false
  end

  create_table "fact_interventions", force: :cascade do |t|
    t.integer "employee_id", null: false
    t.integer "building_id", null: false
    t.integer "battery_id", null: false
    t.integer "column_id"
    t.integer "elevator_id"
    t.datetime "start_intervention", null: false
    t.datetime "end_intervention"
    t.string "result", null: false
    t.text "report"
    t.string "status"
  end

  create_table "fact_quotes", force: :cascade do |t|
    t.integer "quote_id", null: false
    t.datetime "creation_date", null: false
    t.string "company_name", null: false
    t.string "email", null: false
    t.integer "nb_elevator", null: false
  end

end
