require '../logic/user'

describe User, "when first created" do
  before(:each) do
    @user = User.new('julius', :admin)
  end

  it "should have a correct name" do
    @user.name.should eql('julius')
  end

  it "should have a correct type" do
    @user.type.should eql(:admin)
  end
end
