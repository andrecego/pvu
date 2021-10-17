# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_23_125859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "configs", force: :cascade do |t|
    t.bigint "plant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["plant_id"], name: "index_configs_on_plant_id"
  end

  create_table "farms", force: :cascade do |t|
    t.integer "le"
    t.integer "hours"
    t.decimal "le_rate"
    t.bigint "config_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["config_id"], name: "index_farms_on_config_id"
  end

  create_table "plants", force: :cascade do |t|
    t.bigint "external_id"
    t.bigint "token_id"
    t.string "owner_id"
    t.bigint "plant_token_id"
    t.datetime "time_sell"
    t.decimal "starting_price"
    t.decimal "ending_price"
    t.bigint "duration"
    t.integer "status"
    t.datetime "external_updated_at"
    t.string "icon_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stats", force: :cascade do |t|
    t.integer "element"
    t.integer "hp"
    t.integer "def_physics"
    t.integer "def_magic"
    t.integer "damage_physics"
    t.integer "damage_magic"
    t.integer "damage_pure"
    t.integer "damage_hp_loss"
    t.integer "damage_hp_remove"
    t.bigint "config_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["config_id"], name: "index_stats_on_config_id"
  end

  add_foreign_key "configs", "plants"
  add_foreign_key "farms", "configs"
  add_foreign_key "stats", "configs"
end
