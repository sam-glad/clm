require 'rails_helper'

feature 'user creates a new user', %Q(
  As a site visitor
  I want to view a list of my stored searches
  So that I can see them and choose one for more information
) do

  scenario 'user successfully views search index page' do

    user = FactoryGirl.create(:user)
    sign_in_as(user)

    searches = FactoryGirl.create_list(:search, 5, user: user)

    visit searches_path
    searches.each do |search|
      expect(page).to have_content search.query
      expect(page).to have_content search.location
    end
  end
end
