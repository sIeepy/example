FactoryGirl.define do
  factory :micropost do
    content {Faker::Lorem.sentence}
    user
    created_at {Faker::Date.backward(14)}
  end

  factory :micropost_invalid, parent: :micropost do
    content nil
  end
end
