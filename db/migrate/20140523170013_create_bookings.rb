class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :driver_id
      t.text :origin
      t.float :latitude
      t.float :longitude
      t.text :destination
      t.decimal :estimated_cost
      t.string :pickup_time
      t.date :pickup_date
      t.text :notes
      t.integer :status

      t.timestamps
    end

    add_index :bookings, :user_id
    add_index :bookings, :driver_id
  end
end
