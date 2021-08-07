class CreateDirectories < ActiveRecord::Migration[6.1]
  def change
    create_table :directories do |t|
      t.datetime :last_updated
      t.integer :views, default: 0
      t.string :language_name
      t.string :language_description
      t.text :database_description
      t.string :directory_name
      t.string :primarily_spoken_at
      t.integer :user_id

      t.timestamps
    end
  end
end
