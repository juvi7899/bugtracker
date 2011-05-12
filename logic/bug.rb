require 'time'
require './logic/simplerecord'

class Bug < SimpleRecord
  attr_reader :creator
  attr_accessor :name, :priority, :status, :time, :date, :assignees, :important, :private
  has_many :Comment, :bug, :comments
  belongs_to :project

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
    @project = params[:project]
  end

  def date
    @date || @date = Date.parse(@time.to_s)
  end
end
