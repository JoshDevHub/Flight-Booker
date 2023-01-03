class FlightsController < ApplicationController
  def index
    @airport_codes = Airport.all.map(&:airport_code)
    @flight_dates = Flight.list_formatted_departure_dates
    @passengers = params.dig(:search, :passengers)

    @flights = Flight.search(search_params)
  end

  private

  def search_params
    return {} unless params.key?(:search)

    params[:search].slice(
      :departure_airport,
      :arrival_airport,
      :departure_date
    )
  end
end
