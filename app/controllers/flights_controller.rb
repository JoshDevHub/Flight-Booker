class FlightsController < ApplicationController
  def index
    @airport_codes = Airport.all.map(&:airport_code)
    @flight_dates = Flight.select(:departure_time).distinct.order(:departure_time)

    @passengers = params[:passengers]
    @flights = Flight.departing_from(params[:departure_airport])
                     .arriving_at(params[:arrival_airport])
                     .where(departure_time: params[:departure_time])
  end
end
