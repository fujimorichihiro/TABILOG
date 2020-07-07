FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password' }
    confirmed_at {"2020-07-01 01:01:01"}
  end
end