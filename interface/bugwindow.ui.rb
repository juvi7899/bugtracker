=begin
** Form generated from reading ui file 'bugwindow.ui'
**
** Created: Kt Geg 5 16:32:17 2011
**      by: Qt User Interface Compiler version 4.7.0
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_BugWindow
    attr_reader :_2
    attr_reader :formLayout
    attr_reader :label
    attr_reader :nameEdit
    attr_reader :label_2
    attr_reader :label_3
    attr_reader :label_4
    attr_reader :label_5
    attr_reader :dateLabel
    attr_reader :creatorLabel
    attr_reader :priorityBox
    attr_reader :statusBox
    attr_reader :verticalSpacer
    attr_reader :label_6
    attr_reader :importantCheck
    attr_reader :label_8
    attr_reader :gridLayout
    attr_reader :label_7
    attr_reader :commentEdit
    attr_reader :horizontalLayout
    attr_reader :horizontalSpacer
    attr_reader :cancelButton
    attr_reader :saveButton

    def setupUi(bugWindow)
    if bugWindow.objectName.nil?
        bugWindow.objectName = "bugWindow"
    end
    bugWindow.resize(438, 405)
    @_2 = Qt::VBoxLayout.new(bugWindow)
    @_2.objectName = "_2"
    @formLayout = Qt::FormLayout.new()
    @formLayout.objectName = "formLayout"
    @formLayout.fieldGrowthPolicy = Qt::FormLayout::AllNonFixedFieldsGrow
    @label = Qt::Label.new(bugWindow)
    @label.objectName = "label"

    @formLayout.setWidget(0, Qt::FormLayout::LabelRole, @label)

    @nameEdit = Qt::LineEdit.new(bugWindow)
    @nameEdit.objectName = "nameEdit"

    @formLayout.setWidget(0, Qt::FormLayout::FieldRole, @nameEdit)

    @label_2 = Qt::Label.new(bugWindow)
    @label_2.objectName = "label_2"

    @formLayout.setWidget(1, Qt::FormLayout::LabelRole, @label_2)

    @label_3 = Qt::Label.new(bugWindow)
    @label_3.objectName = "label_3"

    @formLayout.setWidget(2, Qt::FormLayout::LabelRole, @label_3)

    @label_4 = Qt::Label.new(bugWindow)
    @label_4.objectName = "label_4"

    @formLayout.setWidget(4, Qt::FormLayout::LabelRole, @label_4)

    @label_5 = Qt::Label.new(bugWindow)
    @label_5.objectName = "label_5"

    @formLayout.setWidget(5, Qt::FormLayout::LabelRole, @label_5)

    @dateLabel = Qt::Label.new(bugWindow)
    @dateLabel.objectName = "dateLabel"
    @font = Qt::Font.new
    @font.bold = true
    @font.weight = 75
    @dateLabel.font = @font

    @formLayout.setWidget(5, Qt::FormLayout::FieldRole, @dateLabel)

    @creatorLabel = Qt::Label.new(bugWindow)
    @creatorLabel.objectName = "creatorLabel"
    @creatorLabel.font = @font

    @formLayout.setWidget(4, Qt::FormLayout::FieldRole, @creatorLabel)

    @priorityBox = Qt::ComboBox.new(bugWindow)
    @priorityBox.objectName = "priorityBox"

    @formLayout.setWidget(1, Qt::FormLayout::FieldRole, @priorityBox)

    @statusBox = Qt::ComboBox.new(bugWindow)
    @statusBox.objectName = "statusBox"

    @formLayout.setWidget(2, Qt::FormLayout::FieldRole, @statusBox)

    @verticalSpacer = Qt::SpacerItem.new(20, 40, Qt::SizePolicy::Minimum, Qt::SizePolicy::Expanding)

    @formLayout.setItem(6, Qt::FormLayout::LabelRole, @verticalSpacer)

    @label_6 = Qt::Label.new(bugWindow)
    @label_6.objectName = "label_6"

    @formLayout.setWidget(7, Qt::FormLayout::LabelRole, @label_6)

    @importantCheck = Qt::CheckBox.new(bugWindow)
    @importantCheck.objectName = "importantCheck"

    @formLayout.setWidget(3, Qt::FormLayout::FieldRole, @importantCheck)

    @label_8 = Qt::Label.new(bugWindow)
    @label_8.objectName = "label_8"

    @formLayout.setWidget(3, Qt::FormLayout::LabelRole, @label_8)


    @_2.addLayout(@formLayout)

    @gridLayout = Qt::GridLayout.new()
    @gridLayout.objectName = "gridLayout"
    @label_7 = Qt::Label.new(bugWindow)
    @label_7.objectName = "label_7"

    @gridLayout.addWidget(@label_7, 0, 0, 1, 1)

    @commentEdit = Qt::PlainTextEdit.new(bugWindow)
    @commentEdit.objectName = "commentEdit"

    @gridLayout.addWidget(@commentEdit, 1, 0, 1, 1)

    @horizontalLayout = Qt::HBoxLayout.new()
    @horizontalLayout.objectName = "horizontalLayout"
    @horizontalSpacer = Qt::SpacerItem.new(40, 20, Qt::SizePolicy::Expanding, Qt::SizePolicy::Minimum)

    @horizontalLayout.addItem(@horizontalSpacer)

    @cancelButton = Qt::PushButton.new(bugWindow)
    @cancelButton.objectName = "cancelButton"

    @horizontalLayout.addWidget(@cancelButton)

    @saveButton = Qt::PushButton.new(bugWindow)
    @saveButton.objectName = "saveButton"

    @horizontalLayout.addWidget(@saveButton)


    @gridLayout.addLayout(@horizontalLayout, 2, 0, 1, 1)


    @_2.addLayout(@gridLayout)


    retranslateUi(bugWindow)

    @priorityBox.setCurrentIndex(1)


    Qt::MetaObject.connectSlotsByName(bugWindow)
    end # setupUi

    def setup_ui(bugWindow)
        setupUi(bugWindow)
    end

    def retranslateUi(bugWindow)
    bugWindow.windowTitle = Qt::Application.translate("BugWindow", "Dialog", nil, Qt::Application::UnicodeUTF8)
    @label.text = Qt::Application.translate("BugWindow", "Name:", nil, Qt::Application::UnicodeUTF8)
    @label_2.text = Qt::Application.translate("BugWindow", "Priority:", nil, Qt::Application::UnicodeUTF8)
    @label_3.text = Qt::Application.translate("BugWindow", "Status:", nil, Qt::Application::UnicodeUTF8)
    @label_4.text = Qt::Application.translate("BugWindow", "Creator:", nil, Qt::Application::UnicodeUTF8)
    @label_5.text = Qt::Application.translate("BugWindow", "Date created:", nil, Qt::Application::UnicodeUTF8)
    @dateLabel.text = Qt::Application.translate("BugWindow", "TextLabel", nil, Qt::Application::UnicodeUTF8)
    @creatorLabel.text = Qt::Application.translate("BugWindow", "TextLabel", nil, Qt::Application::UnicodeUTF8)
    @priorityBox.insertItems(0, [Qt::Application.translate("BugWindow", "Low", nil, Qt::Application::UnicodeUTF8),
        Qt::Application.translate("BugWindow", "Medium", nil, Qt::Application::UnicodeUTF8),
        Qt::Application.translate("BugWindow", "High", nil, Qt::Application::UnicodeUTF8)])
    @statusBox.insertItems(0, [Qt::Application.translate("BugWindow", "New", nil, Qt::Application::UnicodeUTF8),
        Qt::Application.translate("BugWindow", "Reopened", nil, Qt::Application::UnicodeUTF8),
        Qt::Application.translate("BugWindow", "Fixed", nil, Qt::Application::UnicodeUTF8),
        Qt::Application.translate("BugWindow", "Invalid", nil, Qt::Application::UnicodeUTF8)])
    @label_6.text = Qt::Application.translate("BugWindow", "Comments:", nil, Qt::Application::UnicodeUTF8)
    @importantCheck.text = ''
    @label_8.text = Qt::Application.translate("BugWindow", "Important:", nil, Qt::Application::UnicodeUTF8)
    @label_7.text = Qt::Application.translate("BugWindow", "Add your comment:", nil, Qt::Application::UnicodeUTF8)
    @cancelButton.text = Qt::Application.translate("BugWindow", "Cancel", nil, Qt::Application::UnicodeUTF8)
    @saveButton.text = Qt::Application.translate("BugWindow", "Save and close", nil, Qt::Application::UnicodeUTF8)
    end # retranslateUi

    def retranslate_ui(bugWindow)
        retranslateUi(bugWindow)
    end

end

module Ui
    class BugWindow < Ui_BugWindow
    end
end  # module Ui

