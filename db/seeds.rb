100.times do
    name = Faker::Name.name
    User.create(
        name: name,
        password: "password",
        email: Faker::Internet.safe_email(name: "#{name}"),
        location: Faker::Address.city
    )
end

100.times do
    Pet.create(
        name: Faker::FunnyName.name,
        age: Faker::Number.between(from: 1, to: 20).to_i,
        category: Faker::Creature::Animal.name,
        care_instructions: Faker::Lorem.sentence,
        user_id: Faker::Number.between(from: 1, to: 100).to_i
    )
end

200.times do 
    Pet.create(
        name: Faker::Creature::Dog.name,
        age: Faker::Number.between(from: 1, to: 20).to_i,
        category: "Dog",
        care_instructions: Faker::Lorem.sentence,
        user_id: Faker::Number.between(from: 1, to: 100).to_i
    )
end

200.times do
    Pet.create(
        name: Faker::Creature::Cat.name,
        age: Faker::Number.between(from: 1, to: 20).to_i,
        category: "cat",
        care_instructions: Faker::Lorem.sentence,
        user_id: Faker::Number.between(from: 1, to: 100).to_i
    )
end
