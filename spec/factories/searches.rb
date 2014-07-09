# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :search do
    user
    sequence(:query) { |n| "guitar #{n}" }
    city_full 'Ann Arbor'
    city_short 'aaa'
    category_full 'For Sale'
    category_short 'sss'
    min_price 1
    max_price 500
  end
end
