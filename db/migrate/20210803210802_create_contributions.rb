class CreateContributions < ActiveRecord::Migration[6.1]
  def change
    create_table :contributions do |t|
      t.string :word_input, default: nil
      t.string :audio_address, default: nil
      t.string :character_input, default: nil
      t.string :image_address, default: nil
      t.string :definition, default: nil
      t.string :pronunciation, default: nil
      t.boolean :verification_status, default: false
      t.text :sentence_example, default: nil
      t.integer :votes, default: 0
      t.string :word_input_english_translation, default: nil
      t.string :sentence_example_english_translation, default: nil
      t.integer :directory_id
      t.integer :user_id

      t.timestamps
    end
  end
end
