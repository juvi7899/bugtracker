require 'time'

class Bug
  attr_accessor :name, :priority, :status, :date, :assignees, :important

  def initialize(name, priority, creator)
    @name = name
    @priority = priority
    @status = :new
    @creator = creator
    @date = Time.now
    @assignees = []
  end

  def creator
    @creator
  end
end
