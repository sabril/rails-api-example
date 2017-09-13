FactoryGirl.define do
  factory :todo do
    title { Faker::Lorem.word }
    created_by { Faker::StarWars.character }
  end
end
