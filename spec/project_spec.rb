require '../logic/project'

describe Project, "when first created" do
  before(:each) do
    @project = Project.new('project R', 'Test project') 
  end

  it "should have a correct name" do
    @project.name.should eql('project R')
  end

  it "should have a correct description" do
    @project.description.should eql('Test project')
  end
end
