require './logic/comment'
require 'tmpdir'

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

describe Comment, "when modified" do
  before(:each) do
    @comment = Comment.new('julius', 'Lorem Ipsum')
  end

  it "should raise an exception when adding non-existing file" do
    FileUtils.remove_file("#{Dir.tmpdir}/comment_spec.test", true)
    lambda {
      @comment.file = "#{Dir.tmpdir}/comment_spec.test"
    }.should raise_exception(Errno::ENOENT)
  end
end
