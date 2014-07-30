require_relative '../rails_helper'

# User tests pulled from ValidAttribute gem's GitHub page
describe User do
  it { should have_valid(:email).when('test@test.com', 'test+spam@gmail.com') }
  it { should_not have_valid(:email).when('fail', 123) }

  describe 'password' do
    before { subject.password_confirmation = 'password' }
    it { should have_valid(:password).when('password') }
    it { should_not have_valid(:password).when(nil) }
  end

  it { should_not have_valid(:email).when(nil) }
end
