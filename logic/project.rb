require './logic/simplerecord'

class Project < SimpleRecord
  has_one :name, :description, :bugs

  def initialize(name, description)
    @name = name
    @description = description
    @bugs = []
  end
end
