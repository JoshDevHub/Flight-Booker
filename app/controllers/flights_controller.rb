class FlightsController < ApplicationController
  def index
    @airport_codes = Airport.all.map(&:airport_code)

    year, month, day = params[:date].values_at(:year, :month, :day)
    date_search = Date.strptime("#{year} #{month} #{day}", "%Y %m %d")

    @flights = Flight.departing_from(params[:departure_airport])
                     .arriving_at(params[:arrival_airport])
                     .where("DATE(departure_time) = ?", date_search)
  end
end
