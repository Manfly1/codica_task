# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(phone: '+380999999999', password: 'password', password_confirmation: 'password', type: 'AdminUser')

categories = [
  "Family physicians",
  "Internists",
  "Emergency physicians",
  "Obstetricians and gynecologists",
  "Neurologists",
  "Radiologists",
  "Anesthesiologists",
  "Pediatricians"
]
categories.each do |category|
  Category.create(name: category)
end

20.times do
  User.create!(phone: '+380888888888', password: 'password1', password_confirmation: 'password1', categories: categories.sample, avatar: Faker::LoremFlickr.image, type: 'Doctor')
end
