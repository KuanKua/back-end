class CreateUserVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :user_votes do |t|
      t.integer :user_id
      t.integer :contribution_id

      t.timestamps
    end
  end
end
