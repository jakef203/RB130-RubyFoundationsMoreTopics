
class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done
  def initialize(title, description = '')
    @title = title 
    @description = description 
    @done = false 
  end 

  def done? 
    done 
  end

  def done! 
    self.done = true 
  end 

  def undone! 
    self.done = false 
  end 

  def to_s 
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}" 
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList 

  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(new_todo)
    raise TypeError.new("Can only add Todo objects") unless new_todo.instance_of?(Todo)
    @todos << new_todo 
  end
  
  alias_method :<<, :add
  # def <<(new_todo)
  #   raise TypeError.new("Can only add Todo objects") unless new_todo.instance_of?(Todo)
  #   @todos << new_todo
  # end

  def first
    @todos.first
  end

  def last 
    @todos.last 
  end

  def size 
    @todos.size 
  end

  def shift 
    @todos.shift
  end

  def pop 
    @todos.pop 
  end

  def remove_at(index)
    @todos.delete(item_at(index))
  end


  def to_a
    # todos.map(&:title) #{ |todo| todo.title }
    @todos.clone
  end

  def item_at(index)
    @todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done!
    @todos.each { |todo| todo.done! }
  end
  def done?
    @todos.all? { |todo| todo.done? }
  end

  def to_s 
    "#{title}\n" \
    "------------\n" \
    "#{@todos.map(&:to_s).join("\n")}"
  end

  # def each 
  #   counter = 0
  #   while counter < todos.size 
  #     yield(todos[counter])
  #     counter += 1
  #   end
  #   @todos 
  # end

  def each 
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  # def select
  #   result = []
  #   each do |todo|
  #     result << todo if yield(todo)
  #     # puts todo
  #   end
  #   result 
  # end

  # select method that returns a new TodoList object
  # def select
  #   new_todos = [] 
  #   each do |todo|
  #     new_todos << todo if yield(todo)
  #   end
  #   new_todolist = TodoList.new("New list")
  #   new_todos.each { |new_todo| new_todolist << new_todo }
  #   new_todolist
  # end

  def select 
    new_list = TodoList.new(title)
    each do |todo|
      new_list.add(todo) if yield(todo)
    end
    new_list
  end

  def find_by_title(find_title)
    # each do |todo|
    #   return todo if todo.title == find_title
    # end
    # nil   
    #or
    select { |todo| find_title == todo.title }.first
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(title)
    # each do |todo|
    #   if todo.title == title
    #     todo.done! 
    #     # return 
    #   end 
    # end
    find_by_title(title) && find_by_title(title).done!
  end

  def mark_undone(title)
    find_by_title(title) && find_by_title(title).undone!
  end

  def mark_all_done 
    each { |todo| todo.done! }
  end

  def mark_all_undone 
    each { |todo| todo.undone! }
  end
end

todo1 = Todo.new("Boy milk")
# hi = todo1.to_s
# p hi
todo2 = Todo.new("Buy milk")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

list.add(todo1)
list.add(todo2)
list.add(todo3)
list.say_hi
# list.mark_done("Boy milk")
# puts list
# list.mark_undone("Boy milk")
# # puts ans
# puts list
# list.mark_done_at(2)
# list.mark_done_at(0)
# puts ""
# new_list = list.each { |item| puts item }
# puts new_list

# puts list
# puts list.select{ |item| puts item }
# list.shift
# # list.done!
# puts list
# puts ""
# # list.display
# puts ""
# # list.mark_done_at(0)
# # puts list
# list.remove_at(1)
# puts list
# p list.to_a
# puts ""



# puts list.todos
# p list.size 
# puts list.first 
# puts list.last 
# p list.to_a
# p list.item_at(0)
# p list.item_at(2)
# list.mark_done_at(1)
# list.mark_done_at(2)
# list.mark_done_at(0)
# puts list
# puts list.done?
# list.mark_undone_at(-1)
# puts list.todos
# puts list.done?
# # p list.item_at(100)



