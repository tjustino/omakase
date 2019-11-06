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

ActiveRecord::Schema.define(version: 2019_10_08_210928) do

  create_table "encadrants", force: :cascade do |t|
    t.string "nom", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["nom"], name: "index_encadrants_on_nom", unique: true
  end

  create_table "enfants", force: :cascade do |t|
    t.string "nom", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["nom"], name: "index_enfants_on_nom", unique: true
  end

  create_table "inscriptions", force: :cascade do |t|
    t.integer "enfant_id", null: false
    t.integer "encadrant_id", null: false
    t.integer "jour", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["encadrant_id"], name: "index_inscriptions_on_encadrant_id"
    t.index ["enfant_id", "encadrant_id", "jour"], name: "index_inscriptions_on_enfant_id_and_encadrant_id_and_jour", unique: true
    t.index ["enfant_id"], name: "index_inscriptions_on_enfant_id"
  end

  add_foreign_key "inscriptions", "encadrants"
  add_foreign_key "inscriptions", "enfants"
end
