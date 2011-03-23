require 'time'

class Bug
  attr_accessor :name, :priority, :status, :date, :assignees, :important, :private

  def initialize(name, priority, creator)
    @name = name
    @priority = priority
    @status = :new
    @creator = creator
    @date = Time.now
    @assignees = []
    @important = false
    @private = false
  end

  def creator
    @creator
  end
end
