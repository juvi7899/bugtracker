require 'time'

class Bug
  attr_accessor :status, :date

  def initialize
    @status = :new
    @date = Time.now
  end
end
