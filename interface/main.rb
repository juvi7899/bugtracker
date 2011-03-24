#!/usr/bin/env ruby

require 'yaml'
require '../logic/user'
require '../logic/project'
require '../logic/bug'

class Main
  def initialize
    puts "Login failed. Try again" until @user = login
    puts "Invalid project" until @project = select_project
    puts "Invalid bug" until @bug = select_bug
    show_bug(@bug)
    exit
  end

  def login
    begin
      users = load("users.yaml")

      print "Login: "
      username = gets.chomp
      print "Password: "
      password = gets.chomp

      users.each do |user|
        if user.name == username && user.password == Digest::SHA1.hexdigest(password)
          return user
        end
      end
      return false

      rescue
        puts "No users present"
        exit
    end
  end

  def select_project
    begin
      projects = load("projects.yaml")

      puts "Projects: "
      i = 0
      projects.each do |project|
        puts "#{i} #{project.name}"
        i += 1
      end

      print "Select project number: "
      project_no = gets.to_i

      return projects[project_no]

      rescue
        puts "No projects present"
        exit
    end
  end

  def select_bug
    begin
      bugs = load("bugs.yaml")

      puts "Bugs: "
      i = 0
      bugs.each do |bug|
        puts "#{i} #{bug.name}"
        i += 1
      end

      print "Select bug number: "
      bug_no = gets.to_i

      return bugs[bug_no]

      rescue
        puts "No bugs present"
        exit
    end
  end

  def show_bug(bug)
    puts "Creator: #{bug.creator}"
    puts "Important: #{bug.important.to_s}"
    puts "Name: #{bug.name}"
    puts "Priority: #{bug.priority.to_s}"
    puts "Private: #{bug.private.to_s}"
    puts "Status: #{bug.status.to_s}"
    puts "Time: #{bug.time.to_s}"
  end

  def load(file_name)
    File.open(file_name, "r") do |file|
      YAML.load(file)
    end
  end

  def save(file_name, object)
    File.open(file_name, "w") do |file|
      file.puts(object.to_yaml)
    end
  end
end

main = Main.new
