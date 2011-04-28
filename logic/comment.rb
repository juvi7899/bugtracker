class Comment
  has_one :name, :text, :file

  def initialize(params = {})
    super()
    @name = params[:name]
    @text = params[:text]
  end

  def file=(file_name)
    if File.exist? file_name
      @file = file_name
    else
      raise Errno::ENOENT, "No such file or directory - #{file_name}"
    end
  end
end
