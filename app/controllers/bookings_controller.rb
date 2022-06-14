class BookingsController < ApplicationController
  def index
    @passenger = Passenger.find_by email: params[:passenger_email]
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

    respond_to do |format|
      if @booking.save
        @booking.passengers.each do |passenger|
          PassengerMailer.with(passenger: passenger).confirmation_email.deliver_now!
        end
        format.html { redirect_to booking_path(@booking) }
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(
      :flight_id,
      passengers_attributes: %i[id first_name last_name email]
    )
  end
end
