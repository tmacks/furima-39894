FactoryBot.define do
  factory :order_address do
    post_code {'000-0000'}
    prefecture_id { 2 }
    municipality { '横浜市緑区' }
    street_address { '青山1-1-1' }
    building_name { 'フリマ荘' }
    telephonenumber { '0123456789' }
    token {"tok_abcdefghijk00000000000000000"}
    end
end
