require '../logic/user'

describe User, "when first created" do
  before(:each) do
    @user = User.new('julius', 'secret', :admin)
  end

  it "should have a correct name" do
    @user.name.should eql('julius')
  end

  it "should have a correct password hash" do
    @user.password.should eql('e5e9fa1ba31ecd1ae84f75caaa474f3a663f05f4')
  end

  it "should have a correct type" do
    @user.type.should eql(:admin)
  end

  # Does not check if field exists
  it "should not be banned" do
    @user.banned.should_not be_true
  end

  it "should be not banned" do
    @user.banned.should be_false
  end
  
  it "should have a current registration time" do
    @user.registered.should be_just_now
  end
end

describe User, "when modified" do
  before(:each) do
    @user = User.new('julius', 'secret', :admin)
  end

  it "should create a hash when changing password" do
    @user.password = 'qwerty'
    @user.password.should eql('b1b3773a05c0ed0176787a4f1574ff0075f7521e')
  end
end
