class Driver < ActiveRecord::Base
  validates :mobileno, uniqueness: true
  STATUS = { :pending => 0, :active => 1, :deleted => 1 }
  has_many :bookings

  class << self
    def get_nearest_driver(booking_id)
      #TODO: use latitude, longitude here to find the nearest
      driver = Driver.all.shuffle.first rescue nil
      return nil if driver.nil?

      driver
    end

    def assign_driver(booking_id)
      booking = Booking.find(booking_id)
      return nil if booking.nil?

      driver = Driver.get_nearest_driver(booking_id)
      return nil if driver.nil?

      unless driver.nil?
        booking.driver = driver
        booking.save

        DriverNotifier.perform_async(booking_id)
      end
 
      driver
    end
  end 
end
