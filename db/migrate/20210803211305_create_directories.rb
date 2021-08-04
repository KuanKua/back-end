class CreateDirectories < ActiveRecord::Migration[6.1]
  def change
    create_table :directories do |t|
      t.datetime :last_updated
      t.integer :views, default: 0
      t.string :language_name

      t.timestamps
    end
  end
end
