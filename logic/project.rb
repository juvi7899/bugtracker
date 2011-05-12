require './logic/simplerecord'

class Project < SimpleRecord
  attr_accessor :name, :description
  has_many :Bug, :project, :bugs

  def initialize(params = {})
    super()
    @name = params[:name]
    @description = params[:description]
    @bugs = []
  end
end
