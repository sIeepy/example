FactoryGirl.define do
  factory :user do
    email { Faker::Internet.safe_email }
    name { Faker::Name.first_name }
    password { Faker::Internet.password }
  end
end
