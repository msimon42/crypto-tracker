FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Internet.username }
    password { Faker::Internet.password }
  end

  factory :user_test do
    email { 'test@example.com' }
    username { 'user123' }
    password { 'password' }
  end
end
