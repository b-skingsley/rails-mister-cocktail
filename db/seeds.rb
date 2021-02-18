# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
user_serialized = URI.open(url).read
ingredients = JSON.parse(user_serialized)

ingredients["drinks"].each do |i|
  Ingredient.create!(name:i["strIngredient1"])
end

print Ingredient.count
