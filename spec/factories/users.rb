# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@somewhere.com" }
    password 'very_secure'
  end
end
