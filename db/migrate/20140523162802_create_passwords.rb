class CreatePasswords < ActiveRecord::Migration
  def change
    create_table :passwords do |t|
      t.integer :user_id
      t.string :password
      t.string :token
      t.date :sent_at
      t.date :used_at

      t.timestamps
    end

    add_index :passwords, :user_id
    add_index :passwords, :token
  end
end
