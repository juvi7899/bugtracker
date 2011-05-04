=begin
** Form generated from reading ui file 'mainwindow.ui'
**
** Created: Tr Geg 4 18:24:43 2011
**      by: Qt User Interface Compiler version 4.7.0
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_MainWindow
    attr_reader :actionQuit
    attr_reader :actionAbout
    attr_reader :centralwidget
    attr_reader :verticalLayout
    attr_reader :horizontalLayout
    attr_reader :backButton
    attr_reader :forwardButton
    attr_reader :searchEdit
    attr_reader :horizontalLayout_2
    attr_reader :groupBox
    attr_reader :horizontalLayout_3
    attr_reader :projectList
    attr_reader :groupBox_2
    attr_reader :horizontalLayout_4
    attr_reader :bugList
    attr_reader :menubar
    attr_reader :menuFile
    attr_reader :menuHelp
    attr_reader :statusbar

    def setupUi(mainWindow)
    if mainWindow.objectName.nil?
        mainWindow.objectName = "mainWindow"
    end
    mainWindow.resize(800, 600)
    icon = Qt::Icon.new
    icon.addPixmap(Qt::Pixmap.new("pixmaps/bug.png"), Qt::Icon::Normal, Qt::Icon::Off)
    mainWindow.windowIcon = icon
    @actionQuit = Qt::Action.new(mainWindow)
    @actionQuit.objectName = "actionQuit"
    @actionAbout = Qt::Action.new(mainWindow)
    @actionAbout.objectName = "actionAbout"
    @centralwidget = Qt::Widget.new(mainWindow)
    @centralwidget.objectName = "centralwidget"
    @verticalLayout = Qt::VBoxLayout.new(@centralwidget)
    @verticalLayout.objectName = "verticalLayout"
    @horizontalLayout = Qt::HBoxLayout.new()
    @horizontalLayout.objectName = "horizontalLayout"
    @backButton = Qt::ToolButton.new(@centralwidget)
    @backButton.objectName = "backButton"
    icon1 = Qt::Icon.new
    icon1.addPixmap(Qt::Pixmap.new("pixmaps/arrow_left.png"), Qt::Icon::Normal, Qt::Icon::Off)
    @backButton.icon = icon1

    @horizontalLayout.addWidget(@backButton)

    @forwardButton = Qt::ToolButton.new(@centralwidget)
    @forwardButton.objectName = "forwardButton"
    icon2 = Qt::Icon.new
    icon2.addPixmap(Qt::Pixmap.new("pixmaps/arrow_right.png"), Qt::Icon::Normal, Qt::Icon::Off)
    @forwardButton.icon = icon2

    @horizontalLayout.addWidget(@forwardButton)

    @searchEdit = Qt::LineEdit.new(@centralwidget)
    @searchEdit.objectName = "searchEdit"

    @horizontalLayout.addWidget(@searchEdit)


    @verticalLayout.addLayout(@horizontalLayout)

    @horizontalLayout_2 = Qt::HBoxLayout.new()
    @horizontalLayout_2.objectName = "horizontalLayout_2"
    @groupBox = Qt::GroupBox.new(@centralwidget)
    @groupBox.objectName = "groupBox"
    @horizontalLayout_3 = Qt::HBoxLayout.new(@groupBox)
    @horizontalLayout_3.objectName = "horizontalLayout_3"
    @projectList = Qt::ListWidget.new(@groupBox)
    @projectList.objectName = "projectList"

    @horizontalLayout_3.addWidget(@projectList)


    @horizontalLayout_2.addWidget(@groupBox)

    @groupBox_2 = Qt::GroupBox.new(@centralwidget)
    @groupBox_2.objectName = "groupBox_2"
    @horizontalLayout_4 = Qt::HBoxLayout.new(@groupBox_2)
    @horizontalLayout_4.objectName = "horizontalLayout_4"
    @bugList = Qt::ListWidget.new(@groupBox_2)
    @bugList.objectName = "bugList"

    @horizontalLayout_4.addWidget(@bugList)


    @horizontalLayout_2.addWidget(@groupBox_2)


    @verticalLayout.addLayout(@horizontalLayout_2)

    mainWindow.centralWidget = @centralwidget
    @menubar = Qt::MenuBar.new(mainWindow)
    @menubar.objectName = "menubar"
    @menubar.geometry = Qt::Rect.new(0, 0, 800, 27)
    @menuFile = Qt::Menu.new(@menubar)
    @menuFile.objectName = "menuFile"
    @menuHelp = Qt::Menu.new(@menubar)
    @menuHelp.objectName = "menuHelp"
    mainWindow.setMenuBar(@menubar)
    @statusbar = Qt::StatusBar.new(mainWindow)
    @statusbar.objectName = "statusbar"
    mainWindow.statusBar = @statusbar
    Qt::Widget.setTabOrder(@backButton, @forwardButton)
    Qt::Widget.setTabOrder(@forwardButton, @searchEdit)

    @menubar.addAction(@menuFile.menuAction())
    @menubar.addAction(@menuHelp.menuAction())
    @menuFile.addAction(@actionQuit)
    @menuHelp.addAction(@actionAbout)

    retranslateUi(mainWindow)
    Qt::Object.connect(@actionQuit, SIGNAL('triggered()'), mainWindow, SLOT('close()'))

    Qt::MetaObject.connectSlotsByName(mainWindow)
    end # setupUi

    def setup_ui(mainWindow)
        setupUi(mainWindow)
    end

    def retranslateUi(mainWindow)
    mainWindow.windowTitle = Qt::Application.translate("MainWindow", "Bugtracker", nil, Qt::Application::UnicodeUTF8)
    @actionQuit.text = Qt::Application.translate("MainWindow", "Quit", nil, Qt::Application::UnicodeUTF8)
    @actionQuit.shortcut = Qt::Application.translate("MainWindow", "Ctrl+Q", nil, Qt::Application::UnicodeUTF8)
    @actionAbout.text = Qt::Application.translate("MainWindow", "About", nil, Qt::Application::UnicodeUTF8)
    @backButton.text = Qt::Application.translate("MainWindow", "<-", nil, Qt::Application::UnicodeUTF8)
    @forwardButton.text = Qt::Application.translate("MainWindow", "->", nil, Qt::Application::UnicodeUTF8)
    @searchEdit.placeholderText = Qt::Application.translate("MainWindow", "Search for bugs", nil, Qt::Application::UnicodeUTF8)
    @groupBox.title = Qt::Application.translate("MainWindow", "Projects", nil, Qt::Application::UnicodeUTF8)
    @groupBox_2.title = Qt::Application.translate("MainWindow", "Bugs", nil, Qt::Application::UnicodeUTF8)
    @menuFile.title = Qt::Application.translate("MainWindow", "File", nil, Qt::Application::UnicodeUTF8)
    @menuHelp.title = Qt::Application.translate("MainWindow", "Help", nil, Qt::Application::UnicodeUTF8)
    end # retranslateUi

    def retranslate_ui(mainWindow)
        retranslateUi(mainWindow)
    end

end

module Ui
    class MainWindow < Ui_MainWindow
    end
end  # module Ui

