class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :driver
  after_create :assign_driver

  STATUS = { :pending => 0, :accepted => 1, :deleted => 2 }
  TAXI_DISPATCHER_URL = "http://localhost:4000/api/drivers/assign_driver" #this will depend on the actual api url
 
  class << self
    def create_booking(user, booking)
      u = User.find_active_user(user[:mobileno], user[:password])
      return nil if u.nil?

      booked = u.bookings.create(booking)
      booked
    end

    def get_booking(id)
      where("id=?", id).includes("driver").first
    end
  end

private
  def assign_driver
    c = Curl::Easy.http_post(Booking::TAXI_DISPATCHER_URL,
        Curl::PostField.content('booking_id', self.id))
  end
end
