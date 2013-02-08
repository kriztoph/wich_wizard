FactoryGirl.define do
  factory :sandwich do
    sequence :sandwich_type do |n|
      "#{n} Meatballs"
    end
  end
end