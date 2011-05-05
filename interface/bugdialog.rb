require 'Qt4'

class BugDialog < Qt::Dialog
  def initialize(mode)
    super()

    setWindowTitle(mode + " Bug")

    layout = Qt::FormLayout.new(self)
    @name_edit = Qt::LineEdit.new
    layout.addRow("Name:", @name_edit)
    @priority_edit = Qt::LineEdit.new
    layout.addRow("Priority:", @priority_edit)
    @description_edit = Qt::LineEdit.new
    layout.addRow("Comment:", @description_edit)
    login_button = Qt::PushButton.new(mode)
    login_button.connect(SIGNAL(:clicked), &method(:process))
    layout.addRow("", login_button)
    setLayout(layout)
  end

  def process
    close
  end

  def set_data(params = {})
    @name_edit.setText(params[:name])
    @priority_edit.setText(params[:priority])
    @description_edit.setText(params[:description])
  end

  def get_data
    { :name => @name_edit.text, :priority => @priority_edit.text, :description => @description_edit.text }
  end
end
