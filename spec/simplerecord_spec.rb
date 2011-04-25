require './logic/simplerecord.rb'

class LoginList < SimpleRecord
  attr_accessor :username, :password

  def initialize(params)
    @username = params[:username]
    @password = params[:password]
  end
end

describe SimpleRecord do
  before(:each) do
    @logins = LoginList.new
    @logins.new(:username => "Vardenis", :password => "Slaptazodis")
  end

  it "should save a record successfully" do
    lambda {
      @logins.save
    }.should_not raise_exception
  end

  it "should find the record successfully" do
    @logins.password = nil
    @logins.find(:username => "Vardenis", :password => "Slaptazodis")
    @logins.password.should eql("Slaptazodis")
  end

  it "should load a record successfully" do
    @logins.username = nil
    @logins.load
    @logins.username.should eql("Vardenis")
  end
end
