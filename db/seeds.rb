require "faker"

Airport.destroy_all
Flight.destroy_all

def airports_list
  %w[ATL BOS DEN LAX LGA MIA MSP ORD SEA SFO]
end

airports_list.each do |airport_code|
  Airport.create!({ airport_code: airport_code })
end

def date_for(day)
  Faker::Time.between_dates(from: Date.today + (day - 1),
                            to: Date.today + day,
                            period: :day)
end

def create_flights_for(day)
  airports_list.permutation(2).each do |(departure, arrival)|
    Flight.create!(
      flight_duration: rand(60..360),
      departure_time: date_for(day),
      departure_airport: Airport.find_by(airport_code: departure),
      arrival_airport: Airport.find_by(airport_code: arrival)
    )
  end
end

(1..31).each { |day| create_flights_for(day) }
