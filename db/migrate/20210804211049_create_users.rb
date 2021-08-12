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
      t.string :address
      t.string :email
      t.string :phone_number
      t.string :organization
      t.string :website
      t.string :github
      t.string :instagram
      t.string :twitter
      t.string :facebook
      t.string :avatar_address

      t.timestamps
    end
  end
end
