FactoryBot.define do
  factory :tag do
    name { Faker::String.random(length: 4) }
  end
end