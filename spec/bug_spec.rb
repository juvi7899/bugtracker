require 'matchers'
require '../logic/bug'

describe Bug, "when first created" do
  before(:each) do
    @bug = Bug.new('something is wrong', :normal, 'julius')
  end

  it "should have a correct name" do
    @bug.name.should eql('something is wrong')
  end

  it "should have a default (normal) priority" do
    @bug.priority.should eql(:normal)
  end

  it "should have a status of 'NEW'" do
    @bug.status.should eql(:new)
  end

  it "should have a current date" do
    @bug.date.should be_close_to_now(3)
  end

  it "should return creator's name" do
    @bug.creator.should eql('julius')
  end

  it "should have an empty list of asignees" do
    @bug.assignees.should be_empty
  end
end

describe Bug, "when modified" do
  before(:each) do
    @bug = Bug.new('something is wrong', :normal, 'julius')
  end

  it "should assign new person properly" do
    @bug.assignees << 'julius'
    @bug.assignees[0].should eql('julius')
  end
end
