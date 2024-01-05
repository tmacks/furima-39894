FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    encrypted_password    {password}
    last_name             {'テスト'}
    first_name            {'テスト'}
    last_name_kana        {'テスト'}
    first_name_kana       {'テスト'}
    date_of_birth         {'1930/01/01'}
  end
end