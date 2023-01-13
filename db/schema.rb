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

ActiveRecord::Schema[7.0].define(version: 2023011303061012) do
  create_table "dogs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "min_weight"
    t.integer "max_weight"
    t.integer "family_score"
    t.integer "children_score"
    t.integer "other_dog_score"
    t.integer "shedding_score"
    t.integer "grooming_score"
    t.integer "drooling_score"
    t.integer "stranger_score"
    t.integer "playfulness_score"
    t.integer "protective_score"
    t.integer "adaptability_score"
    t.integer "trainability_score"
    t.integer "energy_score"
    t.integer "barking_score"
    t.integer "mental_stim_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "breed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "survey_id"
    t.index ["survey_id"], name: "index_results_on_survey_id"
  end

  create_table "surveys", id: :string, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name_input"
    t.string "size_input"
    t.string "family_input"
    t.string "children_input"
    t.string "other_dog_input"
    t.string "shedding_input"
    t.string "grooming_input"
    t.string "drooling_input"
    t.string "stranger_input"
    t.string "playfulness_input"
    t.string "protective_input"
    t.string "adaptability_input"
    t.string "trainability_input"
    t.string "energy_input"
    t.string "barking_input"
    t.string "mental_stim_input"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "results", "surveys"
end
