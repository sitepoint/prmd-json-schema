require 'activeuuid'
FactoryGirl.define do
  factory :account do
    id { UUIDTools::UUID.random_create }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
