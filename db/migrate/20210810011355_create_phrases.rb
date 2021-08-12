class CreatePhrases < ActiveRecord::Migration[6.1]
  def change
    create_table :phrases do |t|
      t.string :phrase_input
      t.string :meaning
      t.string :pronunciation
      t.string :phrase_english_translation
      t.string :part_of_speech
      t.string :sentence_example
      t.string :sentence_example_english_translation
      t.string :additional_remark
      t.string :phrase_image
      t.string :phrase_audio
      t.integer :directory_id
      t.integer :user_id
      t.integer :votes, default: 0

      t.timestamps
    end
  end
end
