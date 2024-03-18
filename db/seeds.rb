Article.destroy_all

100.times do
  Article.create(
    title: Faker::Movie.title,
    content: Faker::Lorem.paragraph(sentence_count: rand(5..10))
  )
end
