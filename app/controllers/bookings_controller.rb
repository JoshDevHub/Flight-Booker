class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:booking][:flight_id])
    @booking = Booking.new
    params[:booking][:passenger_number].to_i.times do
      @booking.passengers.build
    end
  end

  def create
    p params
    redirect_to root_path
  end
end
