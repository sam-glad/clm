FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password 'qwerty1234567'
    role 'member'
  end
end
