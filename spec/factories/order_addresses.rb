FactoryBot.define do
  factory :order_address do
    postal_code   { '111-1111' }
    prefecture_id {Faker::Number.between(from: 1, to: 47)}
    city          {Faker::Lorem.sentence}
    house_number  {Faker::Lorem.sentence}
    building      {Faker::Lorem.sentence}
    telephone     {Faker::Number.leading_zero_number(digits: 10)}
    token         {Faker::Lorem.sentence}
  end
end