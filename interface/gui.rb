require 'Qt4'
require './interface/loginwindow'

app = Qt::Application.new(ARGV)
LoginWindow.new
app.exec
