require '../logic/log'

describe Log, "when first created" do
  before(:each) do
    @log = Log.new
  end

  it "should have zero entries" do
    @log.size.should eql(0)
  end
end

describe Log, "when modified" do
  before(:each) do
    @log = Log.new
  end

  it "should add a message successfully" do
    @log.add('sample message')
    @log[0].should eql('sample message')
  end

  # Does not check case-insensitivity
  it "should perform a search successfully" do
    @log.add('sample message')
    @log.find('ple mes').should include('sample message')
  end

  it "should perform a case-insensitive search successfully" do
    @log.add('abcd')
    @log.find('aBcD').should include('abcd')
  end
end
