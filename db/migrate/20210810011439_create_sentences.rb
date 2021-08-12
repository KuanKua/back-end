class CreateSentences < ActiveRecord::Migration[6.1]
  def change
    create_table :sentences do |t|
      t.string :sentence_input
      t.string :sentence_english_translation
      t.string :additional_remark
      t.integer :directory_id
      t.string :sentence_image
      t.string :sentence_audio
      t.integer :user_id
      
      t.integer :votes, default: 0

      t.timestamps
    end
  end
end
