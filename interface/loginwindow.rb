require 'Qt4'

class LoginWindow < Qt::Widget
  def initialize
    super
    setWindowTitle("Bugtracker - Login")

    layout = Qt::FormLayout.new(self)
    username_edit = Qt::LineEdit.new
    layout.addRow("User name:", username_edit)
    password_edit = Qt::LineEdit.new
    password_edit.setEchoMode(Qt::LineEdit::Password)
    layout.addRow("Password:", password_edit)
    login_button = Qt::PushButton.new("Login")
    login_button.connect(SIGNAL(:clicked), &method(:login))
    layout.addRow("", login_button)
    setLayout(layout)
    show
  end

  def login
    #@user = User.login(username_edit.text, password_edit.text)
    #if @user
      #Paleidziam programa
    #elsif
      Qt::MessageBox::critical(self, "Login failed", "Login failed\nPlease check your username and password")
  end
end
