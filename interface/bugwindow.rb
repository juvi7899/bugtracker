require './interface/bugwindow.ui'

class BugWindow < Qt::Dialog
  def initialize(parent = nil, bug = nil)
    super(parent)

    @ui = Ui_BugWindow.new
    @ui.setupUi(self)

    @ui.nameEdit.setText(bug.name)
    @ui.creatorLabel.setText(bug.creator)
    @ui.dateLabel.setText(bug.time.to_s)
    case bug.priority
      when :low then @ui.priorityBox.setCurrentIndex(0)
      when :medium then @ui.priorityBox.setCurrentIndex(1)
      when :high then @ui.priorityBox.setCurrentIndex(2)
    end
    case bug.status
      when :new then @ui.statusBox.setCurrentIndex(0)
      when :reopened then @ui.statusBox.setCurrentIndex(1)
      when :fixed then @ui.statusBox.setCurrentIndex(2)
      when :invalid then @ui.statusBox.setCurrentIndex(3)
    end

    comments = Comment.find(:all, :bug => bug.instance_id)
    comments.each do |comment|
      @ui.formLayout.addRow(comment.name, Qt::Label.new(comment.text))
    end
    @ui.saveButton.connect(SIGNAL(:clicked), &method(:process))
  end

  def process
    close
  end

  def get_data
    priority = case @ui.priorityBox.currentIndex
      when 0 then :low
      when 1 then :medium
      when 2 then :high
    end
    status = case @ui.statusBox.currentIndex
      when 0 then :new
      when 1 then :reopened
      when 2 then :fixed
      when 3 then :invalid
    end
    { :name => @ui.nameEdit.text, :priority => priority, :status => status, :comment => @ui.commentEdit.toPlainText }
  end
end