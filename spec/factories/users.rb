FactoryGirl.define do
  factory :user do
    email { Faker::Internet.safe_email }
    name { Faker::Internet.name }
    password { Faker::Internet.password }
  end
end
