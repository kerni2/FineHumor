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
    author factory: %i[user]
  end
end
