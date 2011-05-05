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

  def search
    if @ui.projectList.currentItem

      if @ui.searchEdit.text == ''
        @bugs = Bug.find(:all, :project => @ui.projectList.currentItem.text)
      else
        query = '~' + @ui.searchEdit.text
        @bugs = Bug.find(:all, :project => @ui.projectList.currentItem.text, :name => query)
      end

      @ui.bugList.clear

      @bugs.each do |bug|
        item = Qt::ListWidgetItem.new
        item.setText(bug.name)
        @ui.bugList.addItem(item)
      end

    else
      Qt::MessageBox::critical(self, "Bugtracker", "Select a project first")
    end
  end

  def project_clicked(list_item)
    show_bugs_by_project(list_item.text)
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
    @bugs = Bug.find(:all, :project => project)
    @ui.bugList.clear

    @bugs.each do |bug|
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

    if @ui.projectList.currentItem
      dialog = BugDialog.new("Add")
      dialog.exec
      data = dialog.get_data

      if data[:saved]

        if data[:name] != ''
          bug = Bug.new(:name => data[:name],
                        :priority => data[:priority],
                        :creator => @user.name,
                        :project => @ui.projectList.currentItem.text,
                        :important => data[:important])
          bug.save

          if data[:comment] != ''
            comment = Comment.new(:name => @user.name, :text => data[:comment], :bug => bug.instance_id)
            comment.save
          end

          show_bugs_by_project(@ui.projectList.currentItem.text)
        else
          Qt::MessageBox::critical(self, "Bugtracker", "Bug name is required")
        end

      end
    else
      Qt::MessageBox::critical(self, "Bugtracker", "Select a project first")
    end

  end

  def project_edit

    if @ui.projectList.currentItem
      project = Project.find(:first, :name => @ui.projectList.currentItem.text)
    end

    if project
      dialog = ProjectDialog.new("Edit")
      dialog.exec
      data = dialog.get_data

      if data[:name] != ''
        @bugs.each do |bug|
          bug.project = data[:name]
          bug.save
        end

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

    if @ui.bugList.currentItem
      bug = Bug.find(:first, :name => @ui.bugList.currentItem.text)
      window = BugWindow.new(nil, Bug.find(:first, :name => @ui.bugList.currentItem.text))
      window.exec
      data = window.get_data

      if data[:saved]
        bug.name = data[:name]
        bug.priority = data[:priority]
        bug.status = data[:status]
        bug.important = data[:important]

        if data[:comment].size > 0
          comment = Comment.new(:name => @user.name, :text => data[:comment], :bug => bug.instance_id)
          comment.save
        end

        show_bugs_by_project(@ui.projectList.currentItem.text)
      end
    else
      Qt::MessageBox::critical(self, "Bugtracker", "Select a bug first")
    end

  end

  def project_delete

    if @user.type == :admin

      if @ui.projectList.currentItem
        bugs = Bug.find(:all, :project => @ui.projectList.currentItem.text)

        bugs.each do |bug|
          bug.destroy
        end

        project = Project.find(:first, :name => @ui.projectList.currentItem.text)
        project.destroy
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

      if @ui.bugList.currentItem
        bug = Bug.find(:first, :name => @ui.bugList.currentItem.text)
        comments = Comment.find(:all, :bug => bug.instance_id)

        comments.each do |comment|
          comment.destroy
        end

        bug.destroy
        @ui.bugList.takeItem(@ui.bugList.currentRow)
      else
        Qt::MessageBox::critical(self, "Bugtracker", "Select a bug first")
      end

    else
      Qt::MessageBox::critical(self, "Bugtracker", "Sorry, only admins can delete bugs")
    end

  end

end
