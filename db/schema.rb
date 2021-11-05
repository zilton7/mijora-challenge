# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_05_114002) do

  create_table "parcel_machines", force: :cascade do |t|
    t.string "name"
    t.string "zip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "pm_type"
    t.string "a0_name"
    t.string "a1_name"
    t.string "a2_name"
    t.string "a3_name"
    t.string "a4_name"
    t.string "a5_name"
    t.string "a6_name"
    t.string "a7_name"
    t.string "a8_name"
    t.string "x_coordinate"
    t.string "y_coordinate"
    t.string "service_hours"
    t.string "service_hours_until"
    t.string "service_hours_2"
    t.string "service_hours_2_until"
    t.string "comment_est"
    t.string "comment_eng"
    t.string "comment_rus"
    t.string "comment_lav"
    t.string "comment_lit"
    t.string "modified"
  end

end
