=begin
** Form generated from reading ui file 'mainwindow.ui'
**
** Created: Kt Geg 5 16:21:46 2011
**      by: Qt User Interface Compiler version 4.7.0
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_MainWindow
    attr_reader :actionQuit
    attr_reader :centralwidget
    attr_reader :verticalLayout
    attr_reader :horizontalLayout
    attr_reader :saveButton
    attr_reader :searchEdit
    attr_reader :horizontalLayout_2
    attr_reader :verticalLayout_2
    attr_reader :groupBox
    attr_reader :horizontalLayout_3
    attr_reader :projectList
    attr_reader :horizontalLayout_5
    attr_reader :addProjectButton
    attr_reader :editProjectButton
    attr_reader :deleteProjectButton
    attr_reader :verticalLayout_3
    attr_reader :groupBox_2
    attr_reader :horizontalLayout_4
    attr_reader :bugList
    attr_reader :horizontalLayout_6
    attr_reader :addBugButton
    attr_reader :viewBugButton
    attr_reader :deleteBugButton
    attr_reader :statusbar

    def setupUi(mainWindow)
    if mainWindow.objectName.nil?
        mainWindow.objectName = "mainWindow"
    end
    mainWindow.resize(800, 600)
    icon = Qt::Icon.new
    icon.addPixmap(Qt::Pixmap.new("interface/pixmaps/bug.png"), Qt::Icon::Normal, Qt::Icon::Off)
    mainWindow.windowIcon = icon
    @actionQuit = Qt::Action.new(mainWindow)
    @actionQuit.objectName = "actionQuit"
    @centralwidget = Qt::Widget.new(mainWindow)
    @centralwidget.objectName = "centralwidget"
    @verticalLayout = Qt::VBoxLayout.new(@centralwidget)
    @verticalLayout.objectName = "verticalLayout"
    @horizontalLayout = Qt::HBoxLayout.new()
    @horizontalLayout.objectName = "horizontalLayout"
    @saveButton = Qt::ToolButton.new(@centralwidget)
    @saveButton.objectName = "saveButton"

    @horizontalLayout.addWidget(@saveButton)

    @searchEdit = Qt::LineEdit.new(@centralwidget)
    @searchEdit.objectName = "searchEdit"

    @horizontalLayout.addWidget(@searchEdit)


    @verticalLayout.addLayout(@horizontalLayout)

    @horizontalLayout_2 = Qt::HBoxLayout.new()
    @horizontalLayout_2.objectName = "horizontalLayout_2"
    @verticalLayout_2 = Qt::VBoxLayout.new()
    @verticalLayout_2.objectName = "verticalLayout_2"
    @groupBox = Qt::GroupBox.new(@centralwidget)
    @groupBox.objectName = "groupBox"
    @horizontalLayout_3 = Qt::HBoxLayout.new(@groupBox)
    @horizontalLayout_3.objectName = "horizontalLayout_3"
    @projectList = Qt::ListWidget.new(@groupBox)
    @projectList.objectName = "projectList"

    @horizontalLayout_3.addWidget(@projectList)


    @verticalLayout_2.addWidget(@groupBox)

    @horizontalLayout_5 = Qt::HBoxLayout.new()
    @horizontalLayout_5.objectName = "horizontalLayout_5"
    @addProjectButton = Qt::PushButton.new(@centralwidget)
    @addProjectButton.objectName = "addProjectButton"

    @horizontalLayout_5.addWidget(@addProjectButton)

    @editProjectButton = Qt::PushButton.new(@centralwidget)
    @editProjectButton.objectName = "editProjectButton"

    @horizontalLayout_5.addWidget(@editProjectButton)

    @deleteProjectButton = Qt::PushButton.new(@centralwidget)
    @deleteProjectButton.objectName = "deleteProjectButton"

    @horizontalLayout_5.addWidget(@deleteProjectButton)


    @verticalLayout_2.addLayout(@horizontalLayout_5)


    @horizontalLayout_2.addLayout(@verticalLayout_2)

    @verticalLayout_3 = Qt::VBoxLayout.new()
    @verticalLayout_3.objectName = "verticalLayout_3"
    @groupBox_2 = Qt::GroupBox.new(@centralwidget)
    @groupBox_2.objectName = "groupBox_2"
    @horizontalLayout_4 = Qt::HBoxLayout.new(@groupBox_2)
    @horizontalLayout_4.objectName = "horizontalLayout_4"
    @bugList = Qt::ListWidget.new(@groupBox_2)
    @bugList.objectName = "bugList"

    @horizontalLayout_4.addWidget(@bugList)


    @verticalLayout_3.addWidget(@groupBox_2)

    @horizontalLayout_6 = Qt::HBoxLayout.new()
    @horizontalLayout_6.objectName = "horizontalLayout_6"
    @addBugButton = Qt::PushButton.new(@centralwidget)
    @addBugButton.objectName = "addBugButton"

    @horizontalLayout_6.addWidget(@addBugButton)

    @viewBugButton = Qt::PushButton.new(@centralwidget)
    @viewBugButton.objectName = "viewBugButton"

    @horizontalLayout_6.addWidget(@viewBugButton)

    @deleteBugButton = Qt::PushButton.new(@centralwidget)
    @deleteBugButton.objectName = "deleteBugButton"

    @horizontalLayout_6.addWidget(@deleteBugButton)


    @verticalLayout_3.addLayout(@horizontalLayout_6)


    @horizontalLayout_2.addLayout(@verticalLayout_3)


    @verticalLayout.addLayout(@horizontalLayout_2)

    mainWindow.centralWidget = @centralwidget
    @statusbar = Qt::StatusBar.new(mainWindow)
    @statusbar.objectName = "statusbar"
    mainWindow.statusBar = @statusbar

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
    @saveButton.text = Qt::Application.translate("MainWindow", "Save changes", nil, Qt::Application::UnicodeUTF8)
    @searchEdit.placeholderText = Qt::Application.translate("MainWindow", "Search for bugs", nil, Qt::Application::UnicodeUTF8)
    @groupBox.title = Qt::Application.translate("MainWindow", "Projects", nil, Qt::Application::UnicodeUTF8)
    @addProjectButton.text = Qt::Application.translate("MainWindow", "Add project", nil, Qt::Application::UnicodeUTF8)
    @editProjectButton.text = Qt::Application.translate("MainWindow", "Edit project", nil, Qt::Application::UnicodeUTF8)
    @deleteProjectButton.text = Qt::Application.translate("MainWindow", "Delete project", nil, Qt::Application::UnicodeUTF8)
    @groupBox_2.title = Qt::Application.translate("MainWindow", "Bugs", nil, Qt::Application::UnicodeUTF8)
    @addBugButton.text = Qt::Application.translate("MainWindow", "Add bug", nil, Qt::Application::UnicodeUTF8)
    @viewBugButton.text = Qt::Application.translate("MainWindow", "View bug", nil, Qt::Application::UnicodeUTF8)
    @deleteBugButton.text = Qt::Application.translate("MainWindow", "Delete bug", nil, Qt::Application::UnicodeUTF8)
    end # retranslateUi

    def retranslate_ui(mainWindow)
        retranslateUi(mainWindow)
    end

end

module Ui
    class MainWindow < Ui_MainWindow
    end
end  # module Ui

