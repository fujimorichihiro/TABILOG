FactoryBot.define do
  factory :article do
    title { Faker::String.random(length: 20) }
    body { Faker::String.random(length: 1000) }
    address { Faker::Address.city }
    user
  end
end