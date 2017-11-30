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

ActiveRecord::Schema.define(version: 20171129145309) do

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rentals", force: :cascade do |t|
    t.integer "user_id"
    t.integer "treasure_id"
    t.date "start_date"
    t.date "due_date"
    t.date "return_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user"
    t.integer "treasure"
    t.index ["treasure"], name: "index_rentals_on_treasure"
    t.index ["user"], name: "index_rentals_on_user"
  end

  create_table "storages", force: :cascade do |t|
    t.string "name"
    t.integer "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "address"
    t.index ["address"], name: "index_storages_on_address"
  end

  create_table "treasures", force: :cascade do |t|
    t.integer "owner_id"
    t.integer "type_id"
    t.integer "storage_id"
    t.string "trashed"
    t.string "title"
    t.string "description"
    t.string "special_note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user"
    t.integer "type"
    t.integer "storage"
    t.index ["storage"], name: "index_treasures_on_storage"
    t.index ["type"], name: "index_treasures_on_type"
    t.index ["user"], name: "index_treasures_on_user"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.integer "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "address"
    t.index ["address"], name: "index_users_on_address"
  end

end
