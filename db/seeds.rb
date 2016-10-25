# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
create_account = User.create([email:'f@b.com', password:'fbfbfb', password_confirmation:'fbfbfb', is_admin:'true'])
create_jos = for i in 1..10 do
  Job.create!([title:"Job no.#{i}", description:"It's the No.#{i} Public Job created by the seed.rb", wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100, is_hidden: "false"])
end

create_jos = for i in 1..10 do
  Job.create!([title:"Job no.#{i+10}", description:"It;s the No.#{i+10} Hidden Job created by the seed.rb", wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100, is_hidden: "true"])
end
