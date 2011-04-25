require 'matchers'
require './logic/bug'

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

  it "should have a current creation time" do
    @bug.time.should be_just_now
  end

  it "should return creator's name" do
    @bug.creator.should eql('julius')
  end

  it "should have an empty list of asignees" do
    @bug.assignees.should be_empty
  end
  
  # Does not check if field exists
  it "should not have high importance" do
    @bug.important.should_not eql(true)
  end

  # Does not check if field exists
  it "should not be private" do
    @bug.private.should_not eql(true)
  end

  it "should have default importance" do
    @bug.important.should eql(false)
  end

  it "should have default privacy" do
    @bug.private.should eql(false)
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

  it "should successfully change importance property" do
    lambda {
      @bug.important = true
    }.should change(@bug, :important).from(false).to(true)
  end

  it "should not allow to change creator" do
    lambda {
      @user.creator = 'somebody'
    }.should raise_exception(NoMethodError)
  end
end

describe Bug, "when using it as an active record" do
  before(:each) do
    @bug = Bug.new('something is wrong', :normal, 'julius')
  end

  it "should add a bug successfully" do
    @bugs = [ @bug ]
    @bug.create(:name => "something is wrong", :priority => :normal, :status => :new)
    @bug.find(:all).should eql(@bugs)
  end
end
