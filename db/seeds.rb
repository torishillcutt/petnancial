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

200.times do
    Item.create(
        cost: Faker::Number.between(from: 1, to: 100).to_i,
        order_date: Faker::Date.between(from: 30.days.ago, to: Date.today),
        arrival_date: Faker::Date.between(from: 30.days.ago, to: 20.days.ago),
        category: "Food",
        pet_id: Faker::Number.between(from: 1, to: 500).to_i
    )
end

200.times do
    Item.create(
        cost: Faker::Number.between(from: 1, to: 100).to_i,
        order_date: Faker::Date.between(from: 365.days.ago, to: Date.today),
        arrival_date: Faker::Date.between(from: 365.days.ago, to: 20.days.ago),
        category: "toy",
        pet_id: Faker::Number.between(from: 1, to: 500).to_i
    )
end

200.times do
    Item.create(
        cost: Faker::Number.between(from: 1, to: 100).to_i,
        order_date: Faker::Date.between(from: 365.days.ago, to: Date.today),
        arrival_date: Faker::Date.between(from: 365.days.ago, to: 20.days.ago),
        category: "accessory",
        pet_id: Faker::Number.between(from: 1, to: 500).to_i
    )
end

20.times do 
    Vet.create(
        name: "Dr. #{Faker::Name.name}",
        location: "#{Faker::Address.street_address}, #{Faker::Address.city}",
        specialty: "general veterinary care"
    )
end

1000.times do
    Visit.create(
        pet_id: Faker::Number.between(from: 1, to: 500).to_i,
        vet_id: Faker::Number.between(from: 1, to: 20).to_i,
        cost: Faker::Number.between(from: 1, to: 3000).to_i,
        description: Faker::Lorem.sentence
    )
end

