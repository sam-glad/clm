require_relative '../rails_helper'

describe Post do
  it { should_not have_valid(:search).when(nil) }

  it { should have_valid(:title).when('a string') }
  it { should_not have_valid(:title).when(nil) }

  it { should have_valid(:page_href).when('/abc/cdr/1234567890.html') }
  it { should_not have_valid(:page_href).when(nil) }
  it { should_not have_valid(:page_href).when('foobar') }

  it { should have_valid(:url).when('http://boston.craigslist.org/abc/cdr/1234567890.html') }
  it { should_not have_valid(:url).when('/abc/cdr/1234567890.html') }
  it { should_not have_valid(:url).when('foobar') }

  it { should have_valid(:longitude).when(nil) }
  it { should have_valid(:longitude).when(-180) }
  it { should have_valid(:longitude).when(-1) }
  it { should have_valid(:longitude).when(0) }
  it { should have_valid(:longitude).when(1) }
  it { should have_valid(:longitude).when(180) }
  it { should_not have_valid(:longitude).when(-180.01) }
  it { should_not have_valid(:longitude).when(180.01) }
  it { should_not have_valid(:longitude).when('a string') }

  it { should have_valid(:latitude).when(nil) }
  it { should have_valid(:latitude).when(-90) }
  it { should have_valid(:latitude).when(-1) }
  it { should have_valid(:latitude).when(0) }
  it { should have_valid(:latitude).when(1) }
  it { should have_valid(:latitude).when(90) }
  it { should_not have_valid(:latitude).when(-90.01) }
  it { should_not have_valid(:latitude).when(90.01) }
  it { should_not have_valid(:latitude).when('a string') }
end
