require 'Qt4'
require './logic/project'
require './logic/bug'
require './interface/addprojectwindow'

class BugWindow < Qt::Widget
  def initialize
    super
    setWindowTitle("Bugtracker")

    layout = Qt::HBoxLayout.new(self)
    @project_list = Qt::ListWidget.new
    @bug_list = Qt::ListWidget.new
    layout.addWidget(@project_list)
    layout.addWidget(@bug_list)
    load_projects
    load_bugs
    add_button = Qt::PushButton.new("Add")
    add_button.connect(SIGNAL(:clicked), &method(:add_project))
    layout.addWidget(add_button)
    setLayout(layout)
    show
  end

  def load_projects
    Project.read
    projects = Project.find(:all)
    projects.each do |project|
      @project_list.addItem(project.name)
    end
  end

  def load_bugs
    Bug.read
    bugs = Bug.find(:all)
    bugs.each do |bug|
      @bug_list.addItem(bug.name)
    end
  end

  def add_project
    add_project_window = AddProjectWindow.new
  end
end
