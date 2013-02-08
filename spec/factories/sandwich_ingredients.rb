# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sandwich_ingredient do
    category "MyString"
    ingredient "MyString"
  end
end
