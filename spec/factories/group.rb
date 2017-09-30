FactoryGirl.define do
  factory :group do
    id    Faker::Number.digit
    name  Faker::Team.creature
  end
end
