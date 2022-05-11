require "faker"

Airport.destroy_all
Flight.destroy_all

Airport.create!(
  [
    {
      airport_code: "SFO"
    },
    {
      airport_code: "LAX"
    },
    {
      airport_code: "DEN"
    },
    {
      airport_code: "ATL"
    },
    {
      airport_code: "LGA"
    }
  ]
)

def random_airports
  (1..5).to_a.shuffle.take(2)
end

(1..10).each do |id|
  arrival_id, depart_id = random_airports
  Flight.create!(
    id: id,
    flight_duration: rand(3600..18_000),
    departure_time: Faker::Time.forward(days: 30, period: :day),
    arrival_airport_id: arrival_id,
    departure_airport_id: depart_id
  )
end
