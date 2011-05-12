require './logic/project'

describe Project, "when first created" do
  before(:each) do
    Bug.clear
    Project.clear
    @projects = Project.new(:name => 'project R', :description => 'Test project')
    @projects.save
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

describe Project, "after adding a bug" do
  before(:each) do
    Bug.clear
    Project.clear
    @project = Project.new(:name => 'New project', :description => '')
    @project.save
    @bug = Bug.new(:name => 'New bug', :priority => :medium, :creator => 'julius', :project => @project)
    @bug.save
  end

  it "should return an associated bug" do
    @project.bugs[-1].name.should eql('New bug');
  end

  it "should return a bug with correct project" do
    @project.bugs[-1].project.name.should eql('New project')
  end 
end
