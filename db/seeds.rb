puts "Seeds: start"

User.create!(
  name: 'hubert',
  email: 'hubert@wp.pl',
  password: '11111111'
)

5.times do
  Micropost.create!(
    content: Faker::Lorem.sentence,
    created_at: Faker::Date.backward(14),
    user_id: 1
  )
end
puts 'Seeds: ends'
