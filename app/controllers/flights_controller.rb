class FlightsController < ApplicationController
  def index
    @airport_codes = Airport.all.map(&:airport_code)

    departure_airport = Airport.where("airport_code = ?", params[:departure_airport])
    arrival_airport = Airport.where("airport_code = ?", params[:arrival_airport])

    @flights = Flight.where(
      departure_airport: departure_airport,
      arrival_airport: arrival_airport
    )
  end
end
