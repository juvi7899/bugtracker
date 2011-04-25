require 'Qt4'

class LoginWindow < Qt::Widget
  def initialize
    super
    setWindowTitle("Bugtracker - Login")

    layout = Qt::FormLayout.new(self)
    username_edit = Qt::LineEdit.new
    layout.addRow("User name:", username_edit)
    password_edit = Qt::LineEdit.new
    layout.addRow("Password:", password_edit)
    login_button = Qt::PushButton.new("Login")
    login_button.connect(SIGNAL(:clicked), &method(:login))
    layout.addRow("", login_button)
    setLayout(layout)
    show
  end

  def login
    puts "login pressed"
  end
end
