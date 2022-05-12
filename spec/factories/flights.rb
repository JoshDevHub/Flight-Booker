FactoryBot.define do
  factory :flight do
    departure_time { "2022-05-10 14:51:46" }
    flight_duration { 3600 }
    departure_airport { create(:airport) }
    arrival_airport { create(:airport) }

    trait :arriving_san_francisco do
      arrival_airport { create(:airport, :san_francisco) }
    end

    trait :departing_atlanta do
      departure_airport { create(:airport, :atlanta) }
    end
  end
end
