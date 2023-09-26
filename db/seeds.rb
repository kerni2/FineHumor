50.times do
  title = Faker::Lorem.sentence
  body = Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 4)
  Joke.create title: title, body: body
end
