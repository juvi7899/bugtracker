require '../logic/buglist'
require '../logic/bug'

describe BugList, "when first created" do
  before(:each) do
    @bugs = BugList.new
  end

  it "should have zero entries" do
    @bugs.size.should eql(0)
  end
end

describe BugList, "when modified" do
  before(:each) do
    @bugs = BugList.new
    @bug = Bug.new('something is wrong', :normal, 'julius')
  end

  it "should add a bug successfully" do
    @bugs[0].should eql(@bug)
  end

  it "should perform a case-insensitive search by name successfully" do
    @bugs.find(name = 'thing is').should include(@bug)
  end

  it "should perform a search by priority successfully" do
    @bugs.find(priority = :normal).should include(@bug)
  end

  it "should perform a search by status successfully" do
    @bugs.find(status = :new).should include(@bug)
  end

  it "should perform a case-insensitive search by creator successfully" do
    @bugs.find(creator = 'julius').should include(@bug)
  end

  it "should perform a search by date successfully" do
    @bugs.find(date = Time.now).should include(@bug)
  end
end
