FactoryBot.define do
  factory :flight do
    id { 1 }
    departure_time { "2022-05-10 14:51:46" }
    flight_duration { 60 }
    departure_airport { create(:airport) }
    arrival_airport { create(:airport) }

    trait :arriving_san_francisco do
      arrival_airport { create(:airport, :san_francisco) }
    end

    trait :departing_atlanta do
      departure_airport { create(:airport, :atlanta) }
    end

    trait :departing_may132022 do
      id { 1 }
      departure_time { "Fri, 13 May 2022 00:00:00.000000000 UTC +00:00" }
    end

    trait :second_departing_may132022 do
      id { 2 }
      departure_time { "Fri, 13 May 2022 12:00:00.000000000 UTC +00:00" }
    end

    trait :departing_may242022 do
      id { 3 }
      departure_time { "Wed, 24 May 2022 00:00:00.000000000 UTC +00:00" }
    end

    trait :departing_oct52023 do
      id { 4 }
      departure_time { "Thu, 05 Oct 2023 00:00:00.000000000 UTC +00:00" }
    end

    trait :departing_1115am do
      departure_time { "Wed, 25 May 2022 11:15:00:000000000 UTC +00:00" }
    end

    trait :departing_345pm do
      departure_time { "Wed, 25 May 2022 15:45:00:000000000 UTC +00:00" }
    end

    trait :four_hours_long do
      flight_duration { 240 }
    end

    trait :two_hours_eleven_min do
      flight_duration { 131 }
    end
  end
end
