require '../logic/comment'

describe Comment, "when first created" do
  before(:each) do
    @comment = Comment.new('julius', 'Lorem Ipsum')
  end

  it "should have a commenter's name" do
    @comment.name.should eql('julius')
  end

  it "should have a correct comment text" do
    @comment.text.should eql('Lorem Ipsum')
  end
end
