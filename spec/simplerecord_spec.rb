require './logic/simplerecord'

class LoginList < SimpleRecord
  attr_accessor :username, :password, :number

  def initialize(params)
    super()
    @username = params[:username]
    @password = params[:password]
    @number = 0
  end
end

describe SimpleRecord do
  before(:each) do
    LoginList.clear
    @logins = LoginList.new(:username => "Vardenis", :password => "Slaptazodis")
  end

  it "should save a record successfully" do
    @logins.save.should be_true
  end

  it "should find the record successfully" do
    @logins.save
    @logins.password = nil
    element = LoginList.find(:first, :username => "Vardenis", :password => "Slaptazodis")
    element.password.should eql("Slaptazodis")
  end

  it "should find no records when searching for non-existing records" do
    @logins.save
    elements = LoginList.find(:all, :username => "Something", :number => 1)
    elements.should be_empty
  end

  it "should find no records when using incorrect search params" do
    @logins.save
    elements = LoginList.find(:all, :badfield => "Something")
    elements.should be_empty
  end

  it "should return nil when searching for one record and no records were found" do
    @logins.save
    elements = LoginList.find(:first, :badfield => "Something")
    elements.should be_nil
  end

  it "should perform a case-insensitive search successfully" do
    @logins.save
    element = LoginList.find(:first, :username => "VARDENIS")
    element.password.should eql("Slaptazodis")
  end

  it "should load a file successfully" do
    LoginList.read('LoginList.spec')
    elements = LoginList.find(:all)
    elements[0].username.should eql("Petras")
  end

  it "should destroy a record successfully" do
    LoginList.read('LoginList.spec')
    elements = LoginList.find(:all)
    elements[0].destroy
    elements = LoginList.find(:all)
    elements.should be_empty
  end

  it "should write to file successfully" do
    @logins.save
    LoginList.write('LoginList.temp')
    file1 = "storage/LoginList.yaml"
    file2 = "storage/LoginList.comp.yaml"
    file1.should have_identical_contents_with(file2)
  end

  it "should clear records successfully" do
    LoginList.clear
    elements = LoginList.find(:all) 
    elements.should be_empty
  end

  it "should return a size of records successfully" do
    @logins.save
    elements = LoginList.find(:all)
    LoginList.size.should eql(elements.size)
  end

  it "should create a new file successfully" do
    file_name = "LoginList.new"
    file_path = "storage/#{file_name}.yaml"

    File.delete(file_path)
    LoginList.read_or_create(file_name)
    File.exists?(file_path).should be_true
  end

  it "should load a file successfully after creating it" do
    file_name = "LoginList.new"
    file_path = "storage/#{file_name}.yaml"

    lambda {
      LoginList.read('LoginList.new')
    }.should_not raise_exception
    File.delete(file_path)
  end

  it "should load a non-empty file with no records successfully" do
    LoginList.clear
    LoginList.write('LoginList.new')
    lambda {
      LoginList.read('LoginList.new')
    }.should_not raise_exception
  end

  it "should search find simmilar records when searching with ~" do
    @logins.save
    element = LoginList.find(:first, :username => '~vard')
    element.username.should eql("Vardenis")
  end

  # Required for coverage
  it "should not find any simmilar records when doing bad search with ~" do
    @logins.save
    element = LoginList.find(:first, :username => '~xyz')
    element.should be_nil
  end
end
