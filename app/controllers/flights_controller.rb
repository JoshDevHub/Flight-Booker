class FlightsController < ApplicationController
  def index
    @airport_codes = Airport.all.map(&:airport_code)
    @flight_dates = Flight.list_formatted_departure_dates
    @passengers = params[:passengers]

    @flights = Flight.search(params)
  end
end
