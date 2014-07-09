# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :search do
    user
    sequence(:query) { |n| "guitar #{n}" }
    location 'Ann Arbor'
    category 'for sale'
    min_price 1
    max_price 500
  end
end
