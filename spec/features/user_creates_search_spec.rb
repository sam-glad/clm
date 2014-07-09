require 'rails_helper'

feature 'user creates a new user', %Q(
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
    fill_in 'Location', with: search.location
    fill_in 'Category', with: search.category
    fill_in 'min_price', with: search.min_price
    fill_in 'max_price', with: search.max_price
    click_on 'Submit'

    expect(page).to have_content 'Search added!'
    expect(page).to have_content search.query
  end
end
