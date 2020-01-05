FactoryBot.define do
  factory :asset do
    symbol { Faker::CryptoCoin.acronym }
    name { Faker::CryptoCoin.coin_name}
  end
end
