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

ActiveRecord::Schema.define(version: 2021_03_14_183430) do

  create_table "makeups", charset: "utf8", force: :cascade do |t|
    t.string "brand"
    t.string "name"
    t.string "category"
    t.integer "rating"
    t.text "review"
    t.boolean "repurchase", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand", "name"], name: "index_makeups_on_brand_and_name", unique: true
  end

  create_table "products", charset: "utf8", force: :cascade do |t|
    t.string "size"
    t.string "shade"
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "aasm_state"
    t.date "aasm_state_date"
    t.string "brand"
    t.string "name"
    t.string "category"
    t.string "face_area"
    t.date "purchase_date"
    t.boolean "repurchase", default: false, null: false
    t.boolean "planned", default: false, null: false
    t.boolean "online", default: false, null: false
    t.decimal "price", precision: 10
    t.string "retailer"
    t.integer "rating"
    t.text "review"
    t.index ["aasm_state"], name: "index_products_on_aasm_state"
    t.index ["aasm_state_date"], name: "index_products_on_aasm_state_date"
    t.index ["brand"], name: "index_products_on_brand"
    t.index ["category"], name: "index_products_on_category"
    t.index ["face_area"], name: "index_products_on_face_area"
    t.index ["price"], name: "index_products_on_price"
  end

end
