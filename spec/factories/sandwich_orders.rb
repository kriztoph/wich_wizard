FactoryGirl.define do
  factory :sandwich_order do
    sequence :orderer_name do |n|
      "first#{n}"
    end
  end
end