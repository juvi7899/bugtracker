require './logic/simplerecord'

class Project < SimpleRecord
  has_one :name, :description, :bugs

  def initialize(params = {})
    super()
    @name = params[:name]
    @description = params[:description]
    @bugs = []
  end
end
