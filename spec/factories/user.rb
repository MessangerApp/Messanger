FactoryGirl.define do
  factory :user do
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(8, 20) }

    factory :confirmed_user do
      confirmed_at Time.zone.now
    end
  end
end
