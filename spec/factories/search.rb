FactoryBot.define do
  factory :search do
    association :user
    query { Faker::Lorem.words(number: 3).join(' ') }
  end
end
