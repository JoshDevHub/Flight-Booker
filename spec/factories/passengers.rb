FactoryBot.define do
  factory :passenger do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    booking { nil }
  end
end
