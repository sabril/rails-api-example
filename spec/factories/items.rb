FactoryGirl.define do
  factory :item do
    name { Faker::StarWars.character }
    done false
    todo nil
  end
end
