require 'Qt4'

class BugDialog < Qt::Dialog

  def initialize(mode)
    super()
    setWindowTitle(mode + " Bug")
    @save_changes = false

    layout = Qt::FormLayout.new(self)
    @name_edit = Qt::LineEdit.new
    layout.addRow("Name:", @name_edit)
    @priority_box = Qt::ComboBox.new
    @priority_box.addItem("Low")
    @priority_box.addItem("Medium")
    @priority_box.addItem("High")
    @priority_box.setCurrentIndex(1)
    layout.addRow("Priority:", @priority_box)
    @description_edit = Qt::LineEdit.new
    layout.addRow("Comment:", @description_edit)
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

  def get_data
    priority = case @priority_box.currentIndex
      when 0 then :low
      when 1 then :medium
      when 2 then :high
    end

    {
      :saved => @save_changes,
      :name => @name_edit.text,
      :priority => priority,
      :comment => @description_edit.text
    }
  end

end
