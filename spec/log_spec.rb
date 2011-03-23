require '../logic/log'

describe Log, "when first created" do
  before(:each) do
    @log = Log.new
  end

  it "should have zero entries" do
    @log.size.should eql(0)
  end
end
