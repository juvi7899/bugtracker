require './interface/mainwindow.ui'
require './logic/project'
require './logic/bug'

class MainWindow < Qt::MainWindow
  def initialize(parent = nil)
    super(parent)

    @ui = Ui::MainWindow.new
    @ui.setupUi(self)

    @ui.backButton.connect(SIGNAL(:clicked), &method(:back))
    @ui.forwardButton.connect(SIGNAL(:clicked), &method(:forward))
    @ui.searchEdit.connect(SIGNAL(:returnPressed), &method(:search))

    load_projects
    load_bugs
  end

  def back
    puts "Back"
  end

  def forward
    puts "Forward"
  end

  def search
    puts "Search"
  end

  def load_projects
    Project.read
    @projects = Project.find(:all)
    @projects.each do |project|
      item = Qt::ListWidgetItem.new
      item.setText(project.name)
      item.setToolTip(project.description)
      @ui.projectList.addItem(item)
    end
  end

  def load_bugs
    Bug.read
  end
end
