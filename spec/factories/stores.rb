FactoryBot.define do
  factory :store do
    name { Faker::StarWars.character }
    created_at { Faker::Number.number(10) }
  end
end