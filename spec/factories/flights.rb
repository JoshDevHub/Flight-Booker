FactoryBot.define do
  factory :flight do
    id { 1 }
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

    trait :departing_may132022 do
      departure_time { "Fri, 13 May 2022 00:00:00.000000000 UTC +00:00" }
    end

    trait :departing_oct52023 do
      departure_time { "Thu, 05 Oct 2023 00:00:00.000000000 UTC +00:00" }
    end

    trait :departing_1115am do
      departure_time { "Wed, 25 May 2022 11:15:00:000000000 UTC +00:00" }
    end

    trait :departing_345pm do
      departure_time { "Wed, 25 May 2022 15:45:00:000000000 UTC +00:00" }
    end

    trait :four_hours_long do
      flight_duration { 14_400 }
    end

    trait :two_hours_eleven_min do
      flight_duration { 7860 }
    end
  end
end
