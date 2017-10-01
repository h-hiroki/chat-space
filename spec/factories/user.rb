FactoryGirl.define do
  factory :user do
    id                        Faker::Number.digit
    name                      Faker::Name.name
    email                     Faker::Internet.email
    password                  "12345678"
    password_confirmation     "12345678"
  end
end
