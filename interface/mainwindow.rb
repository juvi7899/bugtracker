require './interface/mainwindow.ui'

class MainWindow < Qt::MainWindow
  def initialize(parent = nil)
    super(parent)
    @ui = Ui::MainWindow.new
    @ui.setupUi(self)
    @ui.backButton.connect(SIGNAL(:clicked), &method(:back))
    @ui.forwardButton.connect(SIGNAL(:clicked), &method(:forward))
    @ui.searchEdit.connect(SIGNAL(:returnPressed), &method(:search))
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
end
