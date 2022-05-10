FactoryBot.define do
  factory :flight do
    departure_time { "2022-05-10 14:51:46" }
    flight_duration { 1 }
    departure_airport { nil }
    arrival_airport { nil }
  end
end
