# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Separate into for loops for each model

# push various ids into separate arrays

for i in 1..20
  tech_ids = Technology.all.pluck(:id)

  tech = Technology.create(
    name: Faker::ProgrammingLanguage.name
  )
  puts "Added #{tech.name}"
end
  
for i in 1..30
  user = User.new(
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10, max_length: 20)
  )
  user.save!
  puts "Created #{user.firstname}"
end

user_ids = User.all.pluck(:id)
unique_user_ids = []

while unique_user_ids.length < 10
  unique_user_ids << user_ids.sample
  unique_user_ids = unique_user_ids.uniq
end

for i in 1..10

  tutor = Tutor.create(
    pricing: rand(2000..30000),
    experience: rand(0..2),
    bio: Faker::Lorem.paragraph,
    style: Faker::Hacker.say_something_smart,
    active: rand(2) == 1,
    maxduration: rand(15..120),
    user_id: unique_user_ids[i]
  )
  puts "New tutor"
end

tutor_ids = Tutor.all.pluck(:id)


for i in 1..20

  tutor = tutor_ids.sample
  user = user_ids.sample

  while Tutor.find(tutor).user_id == user
    user = user_ids.sample
  end

  session = Session.create(
    timestamp: Faker::Time.forward(days: 23, period: :morning),
    duration: rand(15..120),
    cost: rand(500..60000),
    stripe: Faker::Internet.password(min_length: 8, max_length: 8),
    note: Faker::Quote.famous_last_words,
    tutor_id: tutor,
    user_id: user
  )
end

session_ids = Session.all.pluck(:id)
tutor_ids = Session.all.pluck(:tutor_id)
unique_session_ids = []

while unique_session_ids.length < 20
  unique_session_ids << session_ids.sample
  unique_session_ids = unique_session_ids.uniq
end

for i in 1..20  

  rating = Rating.create(
    score: rand(1..5),
    comment: Faker::Hacker.say_something_smart,
    session_id: unique_session_ids[i],
    tutor_id: tutor_ids.sample
  )
end

tutor_ids = Session.all.pluck(:tutor_id)
tech_ids = Technology.all.pluck(:id)

for i in 1..20

  techtutor = TechnologiesTutor.create(
    tutor_id: rand(1..20),
    technology_id: rand(1..20),
    level: rand(0..2)
  )
end