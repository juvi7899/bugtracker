require 'Qt4'

class ProjectDialog < Qt::Dialog
  def initialize(mode)
    super()

    setWindowTitle(mode + " Project")
    @save_changes = false

    layout = Qt::FormLayout.new(self)
    @name_edit = Qt::LineEdit.new
    layout.addRow("Name:", @name_edit)
    @description_edit = Qt::LineEdit.new
    layout.addRow("Description:", @description_edit)
    cancel_button = Qt::PushButton.new("Cancel")
    save_button = Qt::PushButton.new(mode)
    cancel_button.connect(SIGNAL(:clicked)) { close }
    save_button.connect(SIGNAL(:clicked), &method(:process))
    layout.addRow(cancel_button, save_button)
    setLayout(layout)
  end

  def process
    @save_changes = true
    close
  end

  def set_data(params = {})
    @name_edit.setText(params[:name])
    @description_edit.setText(params[:description])
  end

  def get_data
    { :saved => @save_changes, :name => @name_edit.text, :description => @description_edit.text }
  end
end
