require 'rails_helper'

feature 'user creates a new search', %Q(
  As a site visitor
  I want to create a search
  So that I can keep track of something in which I'm interested
) do

  scenario 'user successfully creates a search' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    search = FactoryGirl.build(:search, user: user)

    visit new_search_path
    fill_in 'Query', with: search.query
    select search.location, from: 'Location'
    select search.category, from: 'Category'
    fill_in 'Min Price', with: search.min_price
    fill_in 'Max Price', with: search.max_price
    click_on 'Submit'

    expect(page).to have_content 'Search added!'
    expect(page).to have_content search.query

    click_on search.query
    expect(page).to have_content "Min Price: $#{search.min_price}"
    expect(page).to have_content "Max Price: $#{search.max_price}"
    expect(search.has_img).to eq false
  end

  scenario 'user creates a search with no min/max prices' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    search = FactoryGirl.build(:search, user: user)

    visit new_search_path
    fill_in 'Query', with: search.query
    select search.location, from: 'Location'
    select search.category, from: 'Category'
    check 'Only include posts with images'
    click_on 'Submit'

    expect(page).to have_content 'Search added!'
    expect(page).to have_content search.query

    click_on search.query
    expect(page).to_not have_content 'Min price'
    expect(page).to_not have_content 'Max price'
    expect(Search.first.has_img).to eq true
  end

  scenario 'user enters bad input for min price' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    search = FactoryGirl.build(:search, user: user)

    visit new_search_path
    fill_in 'Query', with: search.query
    select search.location, from: 'Location'
    select search.category, from: 'Category'
    fill_in 'Min Price', with: -1
    click_on 'Submit'

    expect(page).to_not have_content 'Search added!'
    expect(page).to have_content 'Oops! Check your error messages below.'
    expect(page).to have_content 'Min price must be zero or more!'
  end

  scenario 'user enters bad input for min price' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    search = FactoryGirl.build(:search, user: user)

    visit new_search_path
    fill_in 'Query', with: search.query
    select search.location, from: 'Location'
    select search.category, from: 'Category'
    fill_in 'Max Price', with: -1
    click_on 'Submit'

    expect(page).to_not have_content 'Search added!'
    expect(page).to have_content 'Oops! Check your error messages below.'
    expect(page).to have_content 'Max price must be zero or more!'
  end

  scenario 'user fails to create a search ' \
    'without a query, location, or category' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    search = FactoryGirl.build(:search, user: user)

    visit new_search_path
    click_on 'Submit'

    expect(page).to_not have_content 'Search added!'
    expect(page).to have_content 'Oops! Check your error messages below.'

    visit searches_path
    expect(page).to_not have_content search.query
  end

  scenario 'user tries to enter new search page without having signed in' do
    user = FactoryGirl.create(:user)

    visit new_search_path
    expect(page).to have_content 'You need to sign in or sign up ' \
      'before continuing.'
    expect(page).to_not have_content 'Query'
    expect(page).to_not have_content 'Location'
    expect(page).to_not have_content 'Category'
    expect(page).to_not have_content 'Min Price'
    expect(page).to_not have_content 'Max Price'
  end
end
