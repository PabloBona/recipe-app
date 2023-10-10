FactoryBot.define do
  factory :food do
    name { Faker::Food.dish }
    measurement_unit { Faker::Food.metric_measurement }
    price { Faker::Number.decimal(l_digits: 2) }
    quantity { Faker::Number.number(digits: 2) }
    user
  end
end
