require '../logic/bug'

describe Bug, "when first created" do
  it "should have a status of 'NEW'" do
    @bug = Bug.new
    @bug.status.should eql(:new)
  end
end
