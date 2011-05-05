require 'Qt4'
require './interface/loginwindow'

application = Qt::Application.new(ARGV)
login_window = LoginWindow.new
login_window.show
application.exec
