# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    search
    sequence(:title) { |n| "drums #{n}" }
    price 50
    location 'Ann Arbor'
    date Date.parse(Chronic.parse('now').to_s)
    body 'Lots of drums!'
    page_href '/bmw/msg/1234567890.html'
    url 'http://boston.craigslist.org/bmw/msg/1234567890.html'
    google_maps_url 'https://maps.google.com/maps/preview/@50,-50,16z'
  end
end
