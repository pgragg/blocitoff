# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

User.delete_all
Item.delete_all

10.times do |i|
  User.create(email: Faker::Internet.email, password: "password")
end

users = User.all 

100.times do |i|
  users.sample.items.create(name: Faker::Commerce.product_name, created_at: DateTime.now - ([1,2,3,4,5,6].sample))
end 