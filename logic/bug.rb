require 'time'
require './logic/simplerecord'

class Bug < SimpleRecord
  has_one :name, :priority, :status, :creator, :time, :date, :assignees, :important, :private

  def initialize(params = {})
    super()
    @name = params[:name]
    @priority = params[:priority]
    @status = :new
    @creator = params[:creator]
    @time = Time.now
    @assignees = []
    @important = false
    @private = false
  end

  def date
    @date || @date = Date.parse(@time.to_s)
  end

  def creator=(new_creator)
    raise NoMethodError
  end
end
