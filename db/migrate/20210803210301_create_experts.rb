class CreateExperts < ActiveRecord::Migration[6.1]
  def change
    create_table :experts do |t|
      t.string :education
      t.text :linguistic_experience
      t.boolean :verficiation_status
      t.integer :user_id

      t.timestamps
    end
  end
end
