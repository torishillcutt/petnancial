100.times do
    User.create(
        name: Faker::Name.name,
        password: Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3),
        email: Faker::Internet.safe_email,
        location: Faker::Address.city
    )