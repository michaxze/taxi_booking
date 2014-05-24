class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :firstname
      t.string :lastname
      t.integer :mobileno
      t.float :longitude, :precision => 8, :scale => 10
      t.float :latitude, :precision => 8, :scale => 10
      t.integer :status, :default => 0

      t.timestamps
    end

    add_index :drivers, [:mobileno, :status]
  end
end
