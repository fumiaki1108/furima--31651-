FactoryBot.define do
  factory :item do
    name                  {Faker::Lorem.sentence}
    info                  {Faker::Lorem.sentence}
    price                 {Faker::Number.between(from: 300, to: 9999999)}
    category_id           {Faker::Number.between(from: 2, to: 11)}
    sales_status_id       {Faker::Number.between(from: 2, to: 7)}
    shipping_fee_id       {Faker::Number.between(from: 2, to: 7)}
    prefecture_id         {Faker::Number.between(from: 1, to: 47)}
    scheduled_delivery_id {Faker::Number.between(from: 2, to: 4)}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'flag.png')
    end
  end
end