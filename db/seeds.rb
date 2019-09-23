# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Trip.create!([
  { price: 10.00, distance: 1000, date: Date.current.beginning_of_month },
  { price: 20.00, distance: 2000, date: Date.current.end_of_month },
  { price: 30.00, distance: 3000, date: Date.current },
  { price: 40.00, distance: 4000, date: Date.current },
  { price: 50.00, distance: 5000, date: 2.months.from_now.to_date }
])



