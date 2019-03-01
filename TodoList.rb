require_relative './Task'
# require 'colorize'

class TodoList
    attr_accessor :name
    attr_reader :tasks
    def initialize(name)
        @tasks = []
        @name = name
    end

    # add_task method
    def add_task(task)
        @tasks << task
    end

    # create_task with given name, description, priority, due_date 
    def create_task(name, description, priority, due_date)
        @tasks << Task.new(name,description, priority, due_date)
    end

    # remove_task method
    def remove_task(name, description)
        @tasks.each_with_index do |task,i|
            if task.name == name and task.description == description
                @tasks.delete_at(i)
                return true
            end
        end
        return false
    end

    # print method
    def print
        puts "Todo List: #{@name}"
        puts "Tasks:"
        puts "-----------------"
        @tasks.each do |task|
            task.print_task
        end
    end

    def list_completed
        completed_tasks = []
        @tasks.each do |task|
            if task.completed
                completed_tasks << task
            end    
        end
        return completed_tasks
    end

    def list_unfinished
        return @tasks - list_completed
    end

    # print a list of tasks passed in
    # used to print completed tasks or unfinished tasks
    def print_list(tasks)
        tasks.each do |task|
            task.print_task
        end
    end

    def print_completed_list
        puts "Completed tasks for #{@name}"
        print_list(list_completed)
    end

    def print_unfinished_list
        puts "Unfinished tasks for #{@name}"
        print_list(list_unfinished)
    end
end

my_list = TodoList.new("My List")
task = Task.new("create lesson", "create a lesson for classes", 75, Time.now)
subtask1 = Task.new("update slides", "update the class slides", 75, Time.now)
subtask2 = Task.new("update canvas", "update the canvas content", 75, Time.now)
task.add_subtask(subtask1)
task.add_subtask(subtask2)
task.set_completed
my_list.add_task(task)


my_list.create_task("team meeting", "weekly team meeting", 50, Time.now)
my_list.print
my_list.print_unfinished_list
my_list.print_completed_list

