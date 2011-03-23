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
end
