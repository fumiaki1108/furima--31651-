FactoryBot.define do
  factory :user do
    nickname              { 'nick' }
    first_name            { '名前' }
    last_name             { '苗字' }
    first_name_kana       { 'ナマエ' }
    last_name_kana        { 'ミョウジ' }
    birth_date            { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6, mix_case: true) }
    password_confirmation { password }
  end
end