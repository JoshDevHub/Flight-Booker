FactoryBot.define do
  factory :booking do
    flight { nil }

    trait :san_francisco_to_atlanta do
      flight { create(:flight, :SFO_to_ATL) }
    end
  end
end
