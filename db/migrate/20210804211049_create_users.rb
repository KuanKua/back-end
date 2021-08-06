class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :password_digest
      t.text :bio
      t.string :date_of_birth
      t.string :nationality
      t.string :education_status
      t.string :country_of_residence

      t.timestamps
    end
  end
end
