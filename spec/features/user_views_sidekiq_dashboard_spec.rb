require 'rails_helper'

feature 'user views sidekiq dashboard', %Q(
  As an admin
  I want to be able to check and manipulate the Sidekiq dashboard
  So that I can keep track of past, current, and future jobs
) do

  scenario 'admin successfully views Sidekiq dashboard' do
    admin = FactoryGirl.create(:user, role: 'admin')
    sign_in_as(admin)

    click_on 'Sidekiq Dashboard'
    expect(page).to have_content('Dashboard')
    expect(page).to have_content('Workers')
    expect(page).to have_content('Queues')
  end

  scenario 'user fails to see Sidekiq dashboard' do
    user = FactoryGirl.create(:user, role: 'member')
    sign_in_as(user)

    expect(page).to_not have_content('Sidekiq Dashboard')
  end

end
