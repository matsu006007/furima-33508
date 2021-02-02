FactoryBot.define do
  factory :buy_info do
    post_code               { '123-1234'}
    ship_region_id          { 2 }
    city                    { '熊谷市'}
    block                   { '上之1-1-1' }
    building                { 'テストハイツ' }
    phone                   { '09012345678'}
    user_id                 { 1 }
    item_id                 { 1 }
    token                   {'tok_abcdefghijk00000000000000000'}
  end
end
