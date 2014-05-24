module Api
  class BookingsController < ApplicationController
    respond_to :json

    def create
      respond_with Booking.create_booking(params[:user], params[:booking])
    end

    def show
      booking = Booking.get_booking(params[:id])

      respond_to do |format|
        format.json { render json: booking.to_json(:include => :driver)}
      end
    end

  end
end
