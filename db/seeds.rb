# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create!(email: 'admin@example.com', password: 'password', role: 'admin', name: 'Admin')
user = User.create!(email: 'user@example.com', password: 'password', role: 'none', name: 'User')
10.times do
  User.create([{ name: Faker::Internet.user_name, email: Faker::Internet.free_email, password: 'password'}])
end

20.times do
  Photo.create([{title: Faker::Superhero.name, image: File.open(Dir.glob(File.join(Rails.root,'app', 'assets', 'images', 'sampleimages', '*')).sample), user_id: User.all.sample.id }])
end