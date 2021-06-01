FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    code { Faker::Code.asin }
    ideal_quantity { Faker::Number.between(1, 10) }
    current_quantity { Faker::Number.between(1, 5) }
  end
end
