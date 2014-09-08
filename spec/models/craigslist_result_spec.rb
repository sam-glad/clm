require_relative '../rails_helper'

describe CraigslistResult do
  before(:each) do
    @index_page = Nokogiri::HTML(open('spec/models/cl_test_index.html'))
    @first_row = @index_page.css('p.row').first
    @second_row = @index_page.css('p.row')[1]
    @third_row = @index_page.css('p.row')[2]
    @first_cl_post = CraigslistResult.new(@first_row, nil, '')
    @second_cl_post = CraigslistResult.new(@second_row, nil, '')
    @third_cl_post = CraigslistResult.new(@third_row, nil, '')
  end

  after(:each) do
    @first_cl_post = nil
    @second_cl_post = nil
    @third_cl_post = nil
  end

  it 'should load the title appropriately' do
    @first_cl_post.title.should == 'Cb drums black w/ cb cymbols'
    @second_cl_post.title.should == 'Reason refill gold bundle software bundle'
  end

  it 'should load the price appropriately' do
    @first_cl_post.price.should == 300
    @second_cl_post.price.should == 150
  end

  it 'should load the date appropriately' do
    @first_cl_post.date.to_s.should == '2015-08-01'
    @second_cl_post.date.to_s.should == '2015-08-01'
  end

  it 'should load the body appropriately' do
    @first_cl_post.body.should == "FULL CB DRUM SET WITH THE CYMBOLS from CB AND THE THRONE\nALL DRUMS AND CYMBOLS LIKE NEW"
    @second_cl_post.body.should == "Comes with the first 20 Reason Refills. $150 (originally $250) or best offer. No registration, no ilock, and no account required. Just upload the files onto your computer.\n\nComes with:\nSynths 1\nSynths 2\nRhythm section\nPianos and organs\nSymphonic\nOmnisoundz\nReality drums\nMonster drums\nVintage drums\nInstruments of the 60s and 70s\nRetro keys\nAcoustic folk\nWorld percussion\nEthnic instruments\nFilm orchestra \nTriple bass\nTriple guitars\nSynths 3 \nVocal Textures\nMello-T\n\nSoftware bundle must be picked up at Berklee College of Music - 150 Mass. Ave 02115"
    @third_cl_post.body.should ==  "Tama Starclassic 100% Birch kit, \"walnut\" lacquered finish. A few dings in the finish but nothing serious.  Including 3 hardshell Yamaha cases that hold all 4 drums.\n\n10\" rack tom\n12\" rack tom\n14\" floor tom\n22\" kick\nMounting hardware.  I have cymbals stands for additional cash if wanted.\n\nCash/pickup only. Thanks for looking."
  end

  it 'should load the location appropriately' do
    @first_cl_post.location.should == nil
    @second_cl_post.location.should == 'Back bay - boston'
  end

  it 'should load the images appropriately' do
    @third_cl_post.imgs.should include("http://images.craigslist.org/00v0v_6rNpeqwtvKJ_600x450.jpg", "http://images.craigslist.org/00v0v_6rNpeqwtvKJ_600x450.jpg")
  end

  it 'should load the latitude appropriately' do
    @first_cl_post.latitude.should == 42.728100
    @third_cl_post.latitude.should == nil
  end

  it 'should load the longitude appropriately' do
    @first_cl_post.longitude.should == -70.982200
    @third_cl_post.longitude.should == nil
  end

end
