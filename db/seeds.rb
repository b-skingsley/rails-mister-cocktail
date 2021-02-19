# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all


puts "old data destroyed"

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
user_serialized = URI.open(url).read
ingredients = JSON.parse(user_serialized)

ingredients["drinks"].each do |i|
  Ingredient.create!(name:i["strIngredient1"])
end

puts Ingredient.count

mojito = Cocktail.create!(
  name: "Mojito",
  description: "Mojito is a traditional Cuban highball. The cocktail often consists of five ingredients: white rum, sugar, lime juice, soda water, and mint. Its combination of sweetness, citrus, and herbaceous mint flavours is intended to complement the rum, and has made the mojito a popular summer drink."
)

caipirinha = Cocktail.create!(
  name: "Caipirinha",
  description: "Caipirinha is Brazil's national cocktail, made with cachaça, sugar, and lime. The drink is prepared by mixing the fruit and the sugar together, then adding the liquor. This can be made in a single large glass to be shared among people, or in a larger jar, from which it is served in individual glasses"
)

margarita = Cocktail.create!(
  name: "Margarita",
  description: "A margarita is a cocktail consisting of tequila, orange liqueur, and lime juice often served with salt on the rim of the glass. The drink is served shaken with ice, blended with ice, or without ice."
)

file = URI.open("https://source.unsplash.com/random")
mojito.photo.attach(io: file, filename: 'mojito.jpg', content_type: 'image/jpg')

file = URI.open("https://source.unsplash.com/random")
caipirinha.photo.attach(io: file, filename: 'mojito.jpg', content_type: 'image/jpg')

file = URI.open("https://source.unsplash.com/random")
margarita.photo.attach(io: file, filename: 'mojito.jpg', content_type: 'image/jpg')

puts Cocktail.all
