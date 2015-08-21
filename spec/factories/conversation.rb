FactoryGirl.define do
  factory :conversation do
    name { Faker::Lorem.characters(25) }
    association :user, factory: :user
  end
end
