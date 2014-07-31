require_relative '../rails_helper'

describe Image do
  it { should have_valid(:img_url).when('http://images.craigslist.org/' \
    '00u0u_7gygJ3Yl2Mz_600x450.jpg') }
  it { should have_valid(:img_url).when('http://images.craigslist.org/' \
    '00s0s_MaZkwq9r0_600x450.jpg') }
  it { should have_valid(:img_url).when(nil) }
  it { should_not have_valid(:img_url).when('http://images.craigslist.org/' \
    '1234567890.html') }
  it { should_not have_valid(:img_url).when('foobar') }
end
