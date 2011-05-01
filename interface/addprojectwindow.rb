require 'Qt4'
require './logic/project'

class AddProjectWindow < Qt::Widget
  def initialize
    super
    setWindowTitle("Add project")

    layout = Qt::FormLayout.new(self)
    @name_edit = Qt::LineEdit.new
    layout.addRow("Project name:", @name_edit)
    @description_edit = Qt::LineEdit.new
    layout.addRow("Description:", @description_edit)
    add_button = Qt::PushButton.new("Add")
    add_button.connect(SIGNAL(:clicked), &method(:add))
    layout.addRow("", add_button)
    setLayout(layout)
    show
  end

  def add
    @project = Project.new(:name => @name_edit.text, :description => @description_edit.text)
    @project.save
    Project.write
  end
end
