100.times do
    name = Faker::Name.name
    User.create(
        name: name,
        password: "password",
        email: Faker::Internet.safe_email(name: "#{name}"),
        location: Faker::Address.city
    )
end

400.times do
    Pet.create(
        name: Faker::FunnyName.name,
        age: Faker::Number.between(from: 1, to: 20).to_i,
        category: Faker::Creature::Animal.name,
        care_instructions: Faker::Lorem.sentence,
        user_id: Faker::Number.between(from: 1, to: 100).to_i
    )