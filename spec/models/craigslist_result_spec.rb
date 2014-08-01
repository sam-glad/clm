require_relative '../rails_helper'

describe CraigslistResult do
  before(:each) do
    @index_page = Nokogiri::HTML(open('spec/models/cl_test_index.html'))
    @first_row = @index_page.css('p.row').first
    @second_row = @index_page.css('p.row')[1]
    @first_cl_post = CraigslistResult.new(@first_row, nil, '')
    @second_cl_post = CraigslistResult.new(@second_row, nil, '')
  end

  after(:each) do
    @cl_post = nil
  end

  it 'should load the title appropriately' do
    @first_cl_post.title.should == 'Cb drums black w/ cb cymbols'
    @second_cl_post.title.should == 'Reason refill gold bundle software bundle'
  end

  it 'should load the price appropriately' do
    @first_cl_post.price.should == 300
    @second_cl_post.price.should == 150
  end

  it 'should load the location appropriately' do
    @first_cl_post.location.should == nil
    @second_cl_post.location.should == 'Back bay - boston'
  end

end
