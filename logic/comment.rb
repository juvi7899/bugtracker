class Comment
  attr_accessor :name, :text

  def initialize(name, text)
    @name = name
    @text = text
  end

  def file
    @file
  end

  def file=(file_name)
    if File.exist? file_name
      @file = file_name
    else
      raise Errno::ENOENT, "No such file or directory - #{file_name}"
    end
  end
end
