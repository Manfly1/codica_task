# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(phone: Faker::PhoneNumber.cell_phone_with_country_code, password: 'password', password_confirmation: 'password', type: 'AdminUser')

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
  User.create!(phone: Faker::PhoneNumber.cell_phone_with_country_code, password: 'password1', password_confirmation: 'password1', categories: categories.sample, avatar: Faker::LoremFlickr.image, type: 'Doctor')
end

40.times do
  User.create!(phone: Faker::PhoneNumber.cell_phone_with_country_code, password: 'password2', password_confirmation: 'password2', type: 'Patient')
end

50.times do
  appointment = Appointment.new
  appointment.patient = Patient.all.sample
  appointment.doctor = Doctor.all.sample
  appointment.reccomendation = Faker::Lorem.sentence(word_count: rand(10..10))
  
  while appointment.doctor.appointments.where(closed: false).count > 10
      appointment.doctor = Doctor.all.sample
  end

  appointment.save!
end
