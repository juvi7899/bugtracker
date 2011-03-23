require 'time'

class Bug
  attr_accessor :name, :priority, :status, :date

  def initialize(name, priority, creator)
    @name = name
    @priority = priority
    @status = :new
    @creator = creator
    @date = Time.now
  end

  def creator
    @creator
  end
end
