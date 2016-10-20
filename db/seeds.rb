# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "This seed document will automatically generate 1 admin account, 1 normal account, 10 public job posts, and 10 hidden job posts"

create_account = User.create([email: 'davidzhu126@126.com', password: '12345678', password_confirmation: '12345678', is_admin: 'true'])
puts "Admin account created."

create_account = User.create([email: 'dyz2102@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false'])
puts "Normal account created."

create_jos = for i in 1..10 do
  Job.create!([title: "Job no.#{i}", description: "Seed created Public job #{i} ", maxsalary: rand(50..99)*100, minsalary: rand(10..49)*100, is_hidden: "false"])
end
puts "10 Public jobs created."

create_jos = for i in 1..10 do
  Job.create!([title: "Job no.#{i+10}", description: "Seed created Hidden job #{i+10} ", maxsalary: rand(50..99)*100, minsalary: rand(10..49)*100,is_hidden: "true"])
end
puts "10 Hidden jobs created."
