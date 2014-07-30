require_relative '../rails_helper'

describe Post do
  it { should_not have_valid(:search).when(nil) }

  it { should have_valid(:title).when('a string') }
  it { should_not have_valid(:title).when(nil) }

  it { should have_valid(:page_href).when('/abc/cdr/1234567890.html') }
  it { should_not have_valid(:page_href).when(nil) }
  it { should_not have_valid(:page_href).when('foobar') }
end
