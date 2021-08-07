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

ActiveRecord::Schema.define(version: 2021_08_04_211049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contributions", force: :cascade do |t|
    t.string "word_input"
    t.string "audio_address"
    t.string "character_input"
    t.string "image_address"
    t.string "definition"
    t.string "pronunciation"
    t.boolean "verification_status", default: false
    t.text "sentence_example"
    t.integer "votes", default: 0
    t.integer "directory_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "directories", force: :cascade do |t|
    t.datetime "last_updated"
    t.integer "views", default: 0
    t.string "language_name"
    t.string "language_description"
    t.text "database_description"
    t.string "directory_name"
    t.string "primarily_spoken_at"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "experts", force: :cascade do |t|
    t.string "education"
    t.text "linguistic_experience"
    t.boolean "verficiation_status"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_votes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "contribution_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "password_digest"
    t.text "bio"
    t.string "date_of_birth"
    t.string "nationality"
    t.string "education_status"
    t.string "address"
    t.string "email"
    t.string "phone_number"
    t.string "organization"
    t.string "website"
    t.string "github"
    t.string "instagram"
    t.string "twitter"
    t.string "facebook"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
