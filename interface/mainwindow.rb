require './interface/mainwindow.ui'
require './interface/projectdialog'
require './interface/bugdialog'
require './interface/bugwindow'
require './logic/project'
require './logic/bug'
require './logic/comment'

class MainWindow < Qt::MainWindow
  slots 'project_clicked(QListWidgetItem*)'

  def initialize(parent = nil, user = nil)
    super(parent)
    @user = user

    @ui = Ui::MainWindow.new
    @ui.setupUi(self)

    @ui.saveButton.connect(SIGNAL(:clicked), &method(:save))
    @ui.searchEdit.connect(SIGNAL(:returnPressed), &method(:search))
    @ui.addProjectButton.connect(SIGNAL(:clicked), &method(:project_add))
    @ui.editProjectButton.connect(SIGNAL(:clicked), &method(:project_edit))
    @ui.deleteProjectButton.connect(SIGNAL(:clicked), &method(:project_delete))
    @ui.addBugButton.connect(SIGNAL(:clicked), &method(:bug_add))
    @ui.viewBugButton.connect(SIGNAL(:clicked), &method(:bug_view))
    @ui.deleteBugButton.connect(SIGNAL(:clicked), &method(:bug_delete))
    Qt::Object.connect(@ui.projectList, SIGNAL('itemClicked(QListWidgetItem*)'), self, SLOT('project_clicked(QListWidgetItem*)'))

    Project.read_or_create
    Bug.read_or_create
    Comment.read_or_create

    show_projects
  end

  def save
    question = Qt::MessageBox.new
    question.setWindowTitle("Bugtracker")
    question.setText("Are you sure you want to save changes?")
    question.setStandardButtons(Qt::MessageBox::Save | Qt::MessageBox::Cancel)
    question.setDefaultButton(Qt::MessageBox::Cancel)

    if question.exec == Qt::MessageBox::Save
      Project.write
      Bug.write
      Comment.write
    end

  end

  def selected_project
    if @ui.projectList.currentItem
      Project.find(:first, :name => @ui.projectList.currentItem.text)
    end
  end

  def selected_bug
    if @ui.bugList.currentItem
      Bug.find(:first, :name => @ui.bugList.currentItem.text)
    end
  end

  def search
    if selected_project

      if @ui.searchEdit.text == ''
        bugs = selected_project.bugs
      else
        bugs = selected_project.bugs(:name => '~' + @ui.searchEdit.text)
      end

      @ui.bugList.clear

      bugs.each do |bug|
        item = Qt::ListWidgetItem.new
        item.setText(bug.name)

        if bug.priority == :high && bug.status == :new || bug.status == :reopened
          font = item.font
          font.setBold(true)
          item.setFont(font)
        end

        if bug.important
          @ui.bugList.insertItem(0, item)
        else
          @ui.bugList.addItem(item)
        end

    end

    else
      Qt::MessageBox::critical(self, "Bugtracker", "Select a project first")
    end
  end

  def project_clicked(list_item)
    show_bugs_by_project(selected_project)
  end

  def show_projects
    @projects = Project.find(:all)
    @ui.projectList.clear

    @projects.each do |project|
      item = Qt::ListWidgetItem.new
      item.setText(project.name)
      item.setToolTip(project.description)
      @ui.projectList.addItem(item)
    end
  end

  def show_bugs_by_project(project)
    @ui.bugList.clear

    project.bugs.each do |bug|
      item = Qt::ListWidgetItem.new
      item.setText(bug.name)

      if bug.priority == :high && bug.status == :new || bug.status == :reopened
        font = item.font
        font.setBold(true)
        item.setFont(font)
      end

      if bug.important
        @ui.bugList.insertItem(0, item)
      else
        @ui.bugList.addItem(item)
      end

    end
  end

  def project_add
    dialog = ProjectDialog.new("Add")
    dialog.exec
    data = dialog.get_data

    if data[:saved]

      if data[:name] != ''
        project = Project.new(:name => data[:name], :description => data[:description])
        project.save
        show_projects
      else
        Qt::MessageBox::critical(self, "Bugtracker", "Project name is required")
      end

    end
  end

  def bug_add

    if selected_project
      dialog = BugDialog.new("Add")
      dialog.exec
      data = dialog.get_data

      if data[:saved]

        if data[:name] != ''
          bug = Bug.new(:name => data[:name],
                        :priority => data[:priority],
                        :creator => @user.name,
                        :project => selected_project,
                        :important => data[:important])
          bug.save

          if data[:comment] != ''
            comment = Comment.new(:name => @user.name, :text => data[:comment], :bug => bug.instance_id)
            comment.save
          end

          show_bugs_by_project(selected_project)
        else
          Qt::MessageBox::critical(self, "Bugtracker", "Bug name is required")
        end

      end
    else
      Qt::MessageBox::critical(self, "Bugtracker", "Select a project first")
    end

  end

  def project_edit
    if selected_project
      project = selected_project

      dialog = ProjectDialog.new("Edit")
      dialog.exec
      data = dialog.get_data

      if data[:name] != ''
        project.name = data[:name]
        project.description = data[:description]
        project.save
        show_projects
      end

    else
      Qt::MessageBox::critical(self, "Bugtracker", "Select a project first")
    end
  end

  def bug_view

    if selected_bug
      window = BugWindow.new(nil, selected_bug)
      window.exec
      data = window.get_data

      if data[:saved]
        selected_bug.name = data[:name]
        selected_bug.priority = data[:priority]
        selected_bug.status = data[:status]
        selected_bug.important = data[:important]
        selected_bug.save

        if data[:comment].size > 0
          comment = Comment.new(:name => @user.name, :text => data[:comment], :bug => selected_bug)
          comment.save
        end

        show_bugs_by_project(selected_project)
      end
    else
      Qt::MessageBox::critical(self, "Bugtracker", "Select a bug first")
    end

  end

  def project_delete

    if @user.type == :admin

      if selected_project
        selected_project.bugs.each do |bug|
          bug.destroy
        end

        selected_project.destroy
        @ui.projectList.takeItem(@ui.projectList.currentRow)
        @ui.bugList.clear
      else
        Qt::MessageBox::critical(self, "Bugtracker", "Select a project first")
      end

    else
      Qt::MessageBox::critical(self, "Bugtracker", "Sorry, only admins can delete projects")
    end

  end

  def bug_delete

    if @user.type == :admin

      if selected_bug
        selected_bug.comments.each do |comment|
          comment.destroy
        end

        selected_bug.destroy
        @ui.bugList.takeItem(@ui.bugList.currentRow)
      else
        Qt::MessageBox::critical(self, "Bugtracker", "Select a bug first")
      end

    else
      Qt::MessageBox::critical(self, "Bugtracker", "Sorry, only admins can delete bugs")
    end

  end

end
