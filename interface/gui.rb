require 'Qt4'
require './loginwindow'

app = Qt::Application.new(ARGV)
LoginWindow.new
app.exec
