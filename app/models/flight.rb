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

  def self.list_formatted_departure_dates
    order(:departure_time).map(&:departure_date_formatted).uniq
  end

  def self.search(params)
    date = params.dig(:departure_time, :date)
    return none if date.blank?

    departing_from(params[:departure_airport])
      .arriving_at(params[:arrival_airport])
      .where("DATE(departure_time) = ?", date)
  end

  def departure_date_formatted
    departure_time.strftime("%m/%d/%Y")
  end

  def departure_time_formatted
    departure_time.strftime("%l:%M%P")
  end

  def format_duration
    minutes = flight_duration
    format(
      "%<hour>d:%<min>2.2d",
      {
        hour: minutes / 60,
        min: minutes % 60
      }
    )
  end
end
