require 'rails_helper'

feature 'user views a search\'s show page (with prices)', %Q(
  As a site visitor
  I want to see a page with information on a given search
  So that I can keep track of the search's details
) do

  scenario 'user views a search\'s show page (no prices)' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    search = FactoryGirl.create(:search, user: user,
      min_price: nil, max_price: nil)

    visit search_path(search)
    expect(page).to have_content search.query
    expect(page).to have_content search.location
    expect(page).to have_content search.category
    expect(page).to_not have_content 'Min Price'
    expect(page).to_not have_content 'Max Price'
  end

  scenario 'user views a search\'s show page' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    search = FactoryGirl.create(:search, user: user)

    visit search_path(search)
    expect(page).to have_content search.query
    expect(page).to have_content search.location
    expect(page).to have_content search.category
    expect(page).to have_content search.min_price
    expect(page).to have_content search.max_price
  end
end
