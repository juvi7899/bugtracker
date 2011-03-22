require 'matchers'
require '../logic/bug'

describe Bug, "when first created" do
  it "should have a status of 'NEW'" do
    @bug = Bug.new
    @bug.status.should eql(:new)
  end

  it "should have a current date" do
    @bug = Bug.new
    @bug.date.should be_close_to_now(3)
  end
end
