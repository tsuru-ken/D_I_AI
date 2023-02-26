FactoryBot.define do
  factory :partner do
    name { Faker::Company.name }
    address { Faker::Address.full_address }
    url { Faker::Internet.url }
    established { Faker::Date.backward(days: 365) }
    service { Faker::Lorem.paragraph }
    engineer { Faker::Name.name }
    provision { rand(0..1000) }
    product { Faker::Lorem.paragraph }
    user
  end
end