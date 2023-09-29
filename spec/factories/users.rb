FactoryBot.define do
  sequence :email do |n|
    "user#{n}@mail.ru"
  end

  factory :user do
    email
    password { '111111' }
    password_confirmation { '111111' }
  end
end
