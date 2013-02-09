FactoryGirl.define do
  factory :sandwich_order do
    sequence :orderer_name do |n|
      "first#{n}"
    end
    sequence(:user_id) {|n| "#{n}"}
  end
end