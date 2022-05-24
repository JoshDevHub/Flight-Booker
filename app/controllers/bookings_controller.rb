class BookingsController < ApplicationController
  def index
    passenger = Passenger.find_by email: params[:passenger_email]
    @passenger_name = passenger&.first_name
    @flight = passenger&.booking&.flight
  end

  def new
    @flight = Flight.find(params[:booking][:flight_id])
    @booking = Booking.new
    params[:booking][:passenger_number].to_i.times do
      @booking.passengers.build
    end
  end

  def create
    @booking = Booking.create(booking_params)

    if @booking.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(
      :flight_id,
      passengers_attributes: %i[id first_name last_name email]
    )
  end
end
