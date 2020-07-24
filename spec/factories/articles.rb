FactoryBot.define do
  factory :article do
    title { '東京旅' }
    body { Faker::String.random(length: 1000) }
    address { Faker::Address.city }
    user
  end
end