#!/usr/bin/env ruby

require 'Qt4'
require './interface/loginwindow'
#require './mainwindow'

application = Qt::Application.new(ARGV)
login_window = LoginWindow.new
login_window.show
#main_window = MainWindow.new
#main_window.show
application.exec
