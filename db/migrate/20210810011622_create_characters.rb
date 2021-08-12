class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :character_input
      t.string :pronunciation
      t.string :word_example
      t.string :word_definition
      t.string :word_pronunciation
      t.string :word_part_of_speech
      t.string :additional_remark
      t.string :character_image
      t.string :character_audio
      t.integer :user_id
      
      t.integer :directory_id
      t.integer :votes, default: 0

      t.timestamps
    end
  end
end
