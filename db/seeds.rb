require 'faker'

#Create users
50.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end
users = User.all

#Create tasks
100.times do
  Task.create!(
    user: users.sample,
    description: Faker::Lorem.sentence
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Task.count} tasks created"
