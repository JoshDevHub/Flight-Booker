class FlightsController < ApplicationController
  def index
    @airports = Airport.all

    @flights = Flight.where(
      departure_airport_id: params[:departure_airport],
      arrival_airport_id: params[:arrival_airport]
    )
  end
end
