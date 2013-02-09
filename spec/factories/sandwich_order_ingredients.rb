# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sandwich_order_ingredient do
    sequence(:sandwich_ingredient_id) {|n| "#{n}"}
    sequence(:sandwich_order_id) {|n| "#{n}"}
  end
end
