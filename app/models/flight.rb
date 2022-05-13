class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  def self.arriving_at(code)
    joins(:arrival_airport).where("arrival_airport.airport_code" => code)
  end

  def self.departing_from(code)
    joins(:departure_airport).where("departure_airport.airport_code" => code)
  end

  def departure_date_formatted
    departure_time.strftime("%m/%d/%Y")
  end

  def display_flight
    depart_code, arrival_code = [departure_airport, arrival_airport].map(&:airport_code)
    departure_date = departure_date_formatted
    "#{depart_code} to #{arrival_code} | #{departure_date} | #{format_duration}"
  end

  private

  def format_duration
    seconds = flight_duration
    format(
      "%<hour>2d : %<min>2d",
      {
        hour: seconds / 3600,
        min: seconds / 60 % 60
      }
    )
  end
end
