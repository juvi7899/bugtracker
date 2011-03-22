require 'time'

class Bug
  attr_accessor :name, :priority, :status, :date

  def initialize(creator)
    @status = :new
    @creator = creator
    @date = Time.now
  end

  def creator
    @creator
  end
end
