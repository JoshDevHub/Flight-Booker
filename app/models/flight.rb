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
end
