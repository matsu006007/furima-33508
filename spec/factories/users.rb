FactoryBot.define do
  factory :user do
    nickname                        { Faker::Name.name }
    email                           { Faker::Internet.email }
    password                        { '111aaa' }
    password_confirmation           { password }
    last_name                       { '山田' }
    first_name                      { '陸太郎' }
    last_name_kana                  { 'ヤマダ' }
    first_name_kana                 { 'リクタロウ' }
    birthday                        { Faker::Date.between(from: '2000-01-01', to: '2020-12-31') }
  end
end
