FactoryBot.define do
  factory :inquiry do
    email { "foo@inquiry.com" }
    title { Faker::String.random(length: 20) }
    body { Faker::String.random(length: 100) }
    status { 0 }
  end
end