require_relative '../rails_helper'

describe Search do
  it { should have_valid(:query).when('a string') }
  it { should_not have_valid(:query).when(nil) }

  it { should have_valid(:location).when('Boston') }
  it { should_not have_valid(:location).when(nil) }

  it { should_not have_valid(:user).when(nil) }

  it { should have_valid(:min_price).when(0) }
  it { should have_valid(:min_price).when(1000) }
  it { should have_valid(:min_price).when(nil) }
  it { should_not have_valid(:min_price).when(-1) }
  it { should_not have_valid(:min_price).when(-1000) }
  it { should_not have_valid(:min_price).when('a string') }

  it { should have_valid(:max_price).when(0) }
  it { should have_valid(:max_price).when(1000) }
  it { should have_valid(:max_price).when(nil) }
  it { should_not have_valid(:max_price).when(-1) }
  it { should_not have_valid(:max_price).when(-1000) }
  it { should_not have_valid(:max_price).when('a string') }
end
