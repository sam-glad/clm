require 'rails_helper'

feature 'user views a post\'s show page', %Q(
  As a user
  I want to be able to view a post's information all in one place
  So that I can determine whether I want to contact the poster
) do

  scenario 'user views a post\'s show page (with optional info)' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    search = FactoryGirl.create(:search, user: user)
    post = FactoryGirl.create(:post, search: search)

    visit search_path(search)
    click_on post.title
    expect(page).to have_content post.title
    expect(page).to have_content post.location
    expect(page).to have_content post.price
    expect(page).to have_content post.date
    expect(page).to have_content post.address
    expect(page).to have_link('View the original posting', href: post.url)
  end

  scenario 'user views a post\'s show page (without optional info)' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    search = FactoryGirl.create(:search, user: user)
    post = FactoryGirl.create(:post, search: search, latitude: nil,
      longitude: nil, address: nil)

    visit search_path(search)
    click_on post.title
    expect(page).to have_content post.title
    expect(page).to have_content post.location
    expect(page).to have_content post.price
    expect(page).to have_content post.date
    expect(page).to_not have_content 'Approximate address'
    expect(page).to have_link('View the original posting', href: post.url)
  end
end
