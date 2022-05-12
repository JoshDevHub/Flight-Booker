class FlightsController < ApplicationController
  def index
    @airport_codes = Airport.all.map(&:airport_code)

    departure_airport = Airport.where("airport_code = ?", params[:departure_airport])
    arrival_airport = Airport.where("airport_code = ?", params[:arrival_airport])

    year, month, day = params[:date].values_at(:year, :month, :day)
    date_search = Date.strptime("#{year} #{month} #{day}", "%Y %m %d")

    @flights = Flight.where(
      departure_airport: departure_airport,
      arrival_airport: arrival_airport
    ).where("DATE(departure_time) = ?", date_search)
  end
end
