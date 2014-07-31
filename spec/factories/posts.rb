# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    search
    sequence(:title) { |n| "drums #{n}" }
    price 50
    location 'Ann Arbor'
    date Date.parse(Chronic.parse('now').to_s)
    body 'Lots of drums!'
    sequence(:page_href) { |n| "/bmw/msg/#{n}234567890.html" }
    sequence(:url) { |n| "http://boston.craigslist.org/bmw/msg/#{n}234567890.html" }
    latitude 45.0
    longitude 45.0
    address 'P263, Stavropol Krai, Russia'
  end
end
