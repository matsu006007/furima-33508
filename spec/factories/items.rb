FactoryBot.define do
  factory :item do
    product_name            { Faker::Commerce.product_name }
    product_description     { Faker::Lorem.sentence }
    price                   { Faker::Number.number(digits: 5) }
    category_id                { 2 }
    product_status_id          { 2 }
    freight_id                 { 2 }
    ship_region_id             { 2 }
    ship_date_id               { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
