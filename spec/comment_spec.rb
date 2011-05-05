require './logic/comment'
require 'tmpdir'

describe Comment, "when first created" do
  before(:each) do
    @comments = Comment.new(:name => 'julius', :text => 'Lorem Ipsum', :bug => 0)
  end

  it "should have a commenter's name" do
    @comments.name.should eql('julius')
  end

  it "should have a correct comment text" do
    @comments.text.should eql('Lorem Ipsum')
  end

  it "should have no files attached" do
    @comments.file.should be_nil
  end

  it "should have a correct bug id" do
    @comments.bug.should be_zero
  end
end

describe Comment, "when modified" do
  before(:each) do
    @comments = Comment.new(:name => 'julius', :text => 'Lorem Ipsum')
  end

  it "should raise an exception when adding non-existing file" do
    FileUtils.remove_file("#{Dir.tmpdir}/comment_spec.test", true)
    lambda {
      @comments.file = "#{Dir.tmpdir}/comment_spec.test"
    }.should raise_exception(Errno::ENOENT)
  end

  it "should add a file successfully" do
    lambda {
      temp_file = '/tmp/comment_spec.temp'
      FileUtils.touch(temp_file)
      @comments.file = temp_file
      File.delete(temp_file)
    }.should_not raise_exception
  end
end
