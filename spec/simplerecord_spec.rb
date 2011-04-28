require './logic/simplerecord'

class LoginList < SimpleRecord
  has_one :username, :password

  def initialize(params)
    super()
    @username = params[:username]
    @password = params[:password]
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
end
