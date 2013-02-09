# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sandwich_ingredient do
    sequence(:category) {|n| "category#{n}"}
    sequence(:ingredient) {|n| "ingredient#{n}"}
  end
end
