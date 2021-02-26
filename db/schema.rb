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

ActiveRecord::Schema.define(version: 2021_02_26_104035) do

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.integer "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_members_on_team_id"
  end

  create_table "minutelists", force: :cascade do |t|
    t.text "minute", null: false
    t.string "member", null: false
    t.integer "note_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["note_id"], name: "index_minutelists_on_note_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "letternum"
    t.text "agenda"
    t.datetime "datetim"
    t.text "minutes"
    t.text "addnote"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "attendance"
  end

  create_table "noteteamlists", force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "note_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["note_id"], name: "index_noteteamlists_on_note_id"
    t.index ["team_id"], name: "index_noteteamlists_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "username", null: false
    t.string "name"
    t.string "password_digest", null: false
    t.text "desc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["username"], name: "index_teams_on_username", unique: true
  end

  add_foreign_key "members", "teams"
  add_foreign_key "minutelists", "notes"
  add_foreign_key "noteteamlists", "notes"
  add_foreign_key "noteteamlists", "teams"
end
