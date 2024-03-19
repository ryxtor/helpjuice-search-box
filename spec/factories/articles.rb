FactoryBot.define do
  factory :article do
    title { Faker::Movie.title }
    content { Faker::Lorem.paragraph(sentence_count: rand(5..10)) }
  end
end
