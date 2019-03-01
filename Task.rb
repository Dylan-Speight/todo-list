class Task
    attr_accessor :name, :description, :priority, :due_date
    attr_reader :subtasks, :completed
    
    def initialize(name, description, priority, due_date)
        @name = name
        @description = description
        @priority = priority
        @due_date = due_date
        @date_added = Time.now
        @completed = false
        @date_completed = nil
        @subtasks = []
    end

    # set_completed method
    def set_completed
        @completed = true
        @date_completed = Time.now
    end

    # add_subtask method 
    def add_subtask (task)
        @subtasks << task
    end

    # print_task method
    def print_task(is_subtask=false)
        is_subtask ? pad = "   " : pad = ""
        puts "#{pad}Task: #{@name}"
        puts "#{pad}--------------------------"
        puts "#{pad}Description: #{@description}"
        puts "#{pad}Priority: #{@priority}"
        puts "#{pad}Due date: #{@due_date}"
        puts "#{pad}Completed: #{@completed}"
        puts "#{pad}Date completed: #{@date_completed}"
        if @subtasks.length > 0
            puts "#{pad}Subtasks:"
            puts "#{pad}**************"
            @subtasks.each do |task|
                task.print_task(true)
            end
        end
        puts
    end

    def to_s
        print_task
    end

end

# task = Task.new("create lesson", "create a lesson for classes", 75, Time.now)
# subtask1 = Task.new("update slides", "update the class slides", 75, Time.now)
# subtask2 = Task.new("update canvas", "update the canvas content", 75, Time.now)
# task.add_subtask(subtask1)
# task.add_subtask(subtask2)
# task.print_task

# task.set_completed
# task.print_task
# # task.subtasks = [subtask1,subtask2]

# # subtasks = task.subtasks
# subtask3 = Task.new("notify other instructors", "let em know", 75, Time.now)
# # subtasks << subtask3
# # task.subtasks = subtasks



