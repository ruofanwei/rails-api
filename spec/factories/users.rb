FactoryBot.define do
  factory :user do
    username { Faker::StarWars.character }
    created_at { Faker::Number.number(10) }
  end
end