require 'matchers'
require 'date'
require './logic/bug'

describe Bug, "when first created" do
  before(:each) do
    Bug.clear
    Project.clear

    @project = Project.new(:name => 'projektas', :description => '')
    @project.save
    @bugs = Bug.new(:name => 'something is wrong', :priority => :medium, :creator => 'julius', :project => @project)
    @bugs.save
  end

  it "should have a correct name" do
    @bugs.name.should eql('something is wrong')
  end

  it "should have a default (medium) priority" do
    @bugs.priority.should eql(:medium)
  end

  it "should have a status of 'NEW'" do
    @bugs.status.should eql(:new)
  end

  it "should have a current creation time" do
    @bugs.time.to_s.should eql(Time.now.to_s)
  end

  it "should return creator's name" do
    @bugs.creator.should eql('julius')
  end

  it "should have an empty list of assignees" do
    @bugs.assignees.should be_empty
  end
  
  # Does not check if field exists
  it "should not have high importance" do
    @bugs.important.should_not be_true
  end

  # Does not check if field exists
  it "should not be private" do
    @bugs.private.should_not be_true
  end

  it "should have default importance" do
    @bugs.important.should be_false
  end

  it "should have default privacy" do
    @bugs.private.should be_false
  end

  it "should have a correct creation date" do
    @bugs.date.should eql(Date.today)
  end

  it "should have a correct project name" do
    @bugs.project.name.should eql('projektas')
  end

  it "should have a positive id" do
    @bugs.instance_id.should be_natural_number
  end
end

describe Bug, "when modified" do
  before(:each) do
    Bug.clear
    @bugs = Bug.new(:name => 'something is wrong', :priority => :medium, :creator => 'julius')
    @bugs.save
  end

  it "should assign new person properly" do
    @bugs.assignees << 'julius'
    @bugs.assignees[0].should eql('julius')
  end

  it "should successfully change importance property" do
    lambda {
      @bugs.important = true
    }.should change(@bugs, :important).from(false).to(true)
  end

  it "should not allow to change creator" do
    lambda {
      @bugs.creator = 'somebody'
    }.should raise_exception(NoMethodError)
  end
end

describe Bug, "after adding a comment" do
  before(:each) do
    Comment.clear
    Bug.clear
    @bugs = Bug.new(:name => 'something is wrong', :priority => :medium, :creator => 'julius')
    @bugs.save
    @comments = Comment.new(:name => 'julius', :text => 'Sample comment', :bug => @bugs)
    @comments.save
  end

  it "should return an associated comment" do
    @bugs.comments[-1].text.should eql('Sample comment');
  end
end
