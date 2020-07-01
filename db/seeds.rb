# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Userの生成
100.times do |n|
	User.create!(
		name: Faker::Name.name,
		email: "foo#{n+1}@tabilog",
		password: "password",
		confirmed_at: "2020-07-01 01:01:01"
		)
end