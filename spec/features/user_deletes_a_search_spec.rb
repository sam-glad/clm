require 'rails_helper'

feature 'user deletes a search', %Q(
  As a site visitor
  I want to delete a search in which I am no longer interested
  So that it does not clutter up my list of reviews
) do

  scenario 'user successfully deletes a search' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    search1 = FactoryGirl.create(:search, user: user)
    posts = FactoryGirl.create_list(:post, 5, search: search1)

    search2 = FactoryGirl.create(:search, user: user)

    visit search_path(search1)
    click_on 'Delete'

    expect(page).to have_content 'Search deleted!'
    expect(page).to_not have_content search1.query
    expect(Post.count).to eq 0
    expect(page).to have_content search2.query
  end

end
