require '../logic/user'

describe User, "when first created" do
  before(:each) do
    @user = User.new('julius', :admin)
  end

  it "should " do
    @user.type.should eql(:admin)
  end
end
