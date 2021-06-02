FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    code { Faker::Code.asin }
    ideal_quantity { Faker::Number.between(from: 1, to: 10) }
    current_quantity { Faker::Number.between(from: 1, to: 5) }
  end
end
