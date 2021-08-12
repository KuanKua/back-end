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

ActiveRecord::Schema.define(version: 2021_08_10_011743) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.string "activity_log"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string "character_input"
    t.string "pronunciation"
    t.string "word_example"
    t.string "word_definition"
    t.string "word_pronunciation"
    t.string "word_part_of_speech"
    t.string "additional_remark"
    t.string "character_image"
    t.string "character_audio"
    t.integer "user_id"
    t.integer "directory_id"
    t.integer "votes", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

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
    t.string "word_input_english_translation"
    t.string "sentence_example_english_translation"
    t.integer "directory_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "directories", force: :cascade do |t|
    t.integer "views", default: 0
    t.string "language_name"
    t.string "language_description"
    t.text "database_description"
    t.string "directory_name"
    t.string "primarily_spoken_at"
    t.string "directory_type"
    t.integer "goal"
    t.integer "directory_size", default: 0
    t.integer "contr_num", default: 0
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

  create_table "friendships", force: :cascade do |t|
    t.integer "followed_id"
    t.integer "follower_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "longtexts", force: :cascade do |t|
    t.string "long_text_input"
    t.string "long_text_english_translation"
    t.string "additional_remark"
    t.string "long_text_image"
    t.string "long_text_audio"
    t.integer "directory_id"
    t.integer "user_id"
    t.integer "votes", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "phrases", force: :cascade do |t|
    t.string "phrase_input"
    t.string "meaning"
    t.string "pronunciation"
    t.string "phrase_english_translation"
    t.string "part_of_speech"
    t.string "sentence_example"
    t.string "sentence_example_english_translation"
    t.string "additional_remark"
    t.string "phrase_image"
    t.string "phrase_audio"
    t.integer "directory_id"
    t.integer "user_id"
    t.integer "votes", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sentences", force: :cascade do |t|
    t.string "sentence_input"
    t.string "sentence_english_translation"
    t.string "additional_remark"
    t.integer "directory_id"
    t.string "sentence_image"
    t.string "sentence_audio"
    t.integer "user_id"
    t.integer "votes", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_votes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "word_id"
    t.string "value"
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
    t.string "avatar_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "words", force: :cascade do |t|
    t.string "word_input"
    t.string "definition"
    t.string "pronunciation"
    t.string "word_english_translation"
    t.string "part_of_speech"
    t.string "sentence_example"
    t.string "sentence_example_english_translation"
    t.string "additional_remark"
    t.integer "directory_id"
    t.string "word_image"
    t.string "word_audio"
    t.integer "user_id"
    t.integer "votes", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
