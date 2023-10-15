# frozen_string_literal: true

FactoryBot.define do
  sequence :title do |n|
    "MyString#{n}"
  end

  sequence :body do |n|
    "MyText#{n}"
  end

  factory :joke do
    title
    body
    association :user
  end

  factory :tag do
    title { 'MyTag' }

    factory :joke_with_tags do
      jokes { [association(:joke)] }
    end
  end
end
