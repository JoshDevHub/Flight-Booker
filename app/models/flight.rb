class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  has_many :bookings, dependent: :destroy

  def self.arriving_at(code)
    joins(:arrival_airport).where("arrival_airport.airport_code" => code)
  end

  def self.departing_from(code)
    joins(:departure_airport).where("departure_airport.airport_code" => code)
  end

  def departure_date_formatted
    departure_time.strftime("%m/%d/%Y")
  end

  def format_duration
    seconds = flight_duration
    format(
      "%<hour>d:%<min>2.2d",
      {
        hour: seconds / 3600,
        min: seconds / 60 % 60
      }
    )
  end
end
