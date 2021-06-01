FactoryBot.define do
  factory :item do
    name { Faker::Item.name }
    code { Faker::Item.code }
    ideal_quantity { Faker::Item.ideal_quantity }
    current_quantity { Faker::Item.current_quantity }
  end
end
