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

10.times do 
  User.create(email: Faker::Internet.email, password: "password")
end

users = User.all 

100.times {users.sample.items.create(name: Faker::Commerce.product_name)}


# create_table "items", force: :cascade do |t|
#     t.string   "name"
#     t.integer  "user_id"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end

#   add_index "items", ["user_id"], name: "index_items_on_user_id"

#   create_table "users", force: :cascade do |t|
#     t.string   "email"
#     t.string   "password_hash"
#     t.string   "password_salt"
#     t.datetime "created_at",    null: false
#     t.datetime "updated_at",    null: false
#   end