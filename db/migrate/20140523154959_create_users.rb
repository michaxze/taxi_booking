class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :mobileno
      t.string :password
      t.integer :status, :default => 0

      t.timestamps
    end

    add_index :users, [:mobileno, :status]
  end
end
