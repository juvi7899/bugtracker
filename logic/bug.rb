require 'time'

class Bug
  attr_accessor :name, :priority, :status, :time, :assignees, :important, :private

  def initialize(name, priority, creator)
    @name = name
    @priority = priority
    @status = :new
    @creator = creator
    @time = Time.now
    @assignees = []
    @important = false
    @private = false
  end

  def creator
    @creator
  end

  def date
    @date || @date = Date.parse(@time.to_s)
  end
end
