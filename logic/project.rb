class Project
  attr_accessor :name, :description, :bugs

  def initialize(name, description)
    @name = name
    @description = description
    @bugs = []
  end
end
