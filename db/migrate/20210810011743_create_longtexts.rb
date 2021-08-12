class CreateLongtexts < ActiveRecord::Migration[6.1]
  def change
    create_table :longtexts do |t|
      t.string :long_text_input
      t.string :long_text_english_translation
      t.string :additional_remark
      t.string :long_text_image
      t.string :long_text_audio
      t.integer :directory_id
      t.integer :user_id
      
      t.integer :votes, default: 0

      t.timestamps
    end
  end
end
