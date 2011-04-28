require './logic/project'

describe Project, "when first created" do
  before(:each) do
    @projects = Project.new('project R', 'Test project') 
  end

  it "should have a correct name" do
    @projects.name.should eql('project R')
  end

  it "should have a correct description" do
    @projects.description.should eql('Test project')
  end

  it "should have zero bugs assigned" do
    @projects.bugs.should be_empty
  end
end
