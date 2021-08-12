class CreateWords < ActiveRecord::Migration[6.1]
  def change
    create_table :words do |t|
      t.string :word_input
      t.string :definition
      t.string :pronunciation
      t.string :word_english_translation
      t.string :part_of_speech
      t.string :sentence_example
      t.string :sentence_example_english_translation
      t.string :additional_remark
      t.integer :directory_id
      t.string :word_image
      t.string :word_audio
      t.integer :user_id
      t.integer :votes, default: 0

      t.timestamps
    end
  end
end
