FactoryBot.define do
  factory :airport do
    trait :san_francisco do
      airport_code { "SFO" }
    end
    trait :atlanta do
      airport_code { "ATL" }
    end
    trait :la_guardia do
      airport_code { "LGA" }
    end
    trait :denver do
      airport_code { "DEN" }
    end
  end
end
