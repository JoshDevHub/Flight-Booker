class FlightsController < ApplicationController
  def index
    @airport_codes = Airport.all.map(&:airport_code)
    @flight_dates = Flight.list_formatted_departure_dates

    @passengers = params[:passengers]
    @flights = Flight.departing_from(params[:departure_airport])
                     .arriving_at(params[:arrival_airport])
                     .where(
                       "DATE(departure_time) = ?", params[:departure_time]&.[](:date)
                     )
  end
end
