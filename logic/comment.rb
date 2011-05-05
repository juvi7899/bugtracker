require './logic/simplerecord'

class Comment < SimpleRecord
  has_one :name, :text, :file, :bug, :date

  def initialize(params = {})
    super()
    @name = params[:name]
    @text = params[:text]
    @bug = params[:bug]
    @date = Date.today
  end

  def file=(file_name)

    if File.exist? file_name
      @file = file_name
    else
      raise Errno::ENOENT, "No such file or directory - #{file_name}"
    end

  end

end
