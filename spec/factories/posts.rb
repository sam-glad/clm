# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    search
    sequence(:title) { |n| "drums #{n}" }
    price 50
    location 'Ann Arbor'
    date Date.parse(Chronic.parse('now').to_s)
    body 'Lots of drums!'
    sequence(:page_href) { |n| "/bmw/msg/12345#{n}7890.html" }
    url 'http://boston.craigslist.org/bmw/msg/1234567890.html'
    latitude 45.0
    longitude 45.0
    address '123 Fake St., Springfield, USA'
  end
end
