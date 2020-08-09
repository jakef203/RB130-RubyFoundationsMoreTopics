
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todo_list_cp'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    todo = @list.shift 
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop 
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  # def test_done?
  #   @todos.each { |todo| todo.done! }
  #   @todos.zip(@list.to_a).each do |exp, act|
  #     assert_match(exp, act)
  #   end
  # end

  def test_bad_item
    assert_raises(TypeError) { @list.add(2) }
    assert_raises(TypeError) { @list.add("hi") }
  end

  def test_shovel
    new_todo = Todo.new("Go to church")
    @list << new_todo 
    @todos << new_todo
    assert_equal(@todos, @list.to_a)
  end

  def test_add 
    new_todo = Todo.new("Go to church")
    @list.add(new_todo) 
    @todos << new_todo
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(4) }
    assert_raises(ArgumentError) { @list.item_at }
    assert_equal(@todo1, @list.item_at(0))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(4) }
    assert_raises(ArgumentError) { @list.mark_done_at }
    @list.mark_done_at(0)
    @list.mark_done_at(1)
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(4) }
    assert_raises(ArgumentError) { @list.mark_undone_at }   
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo2.done?)
    
    @todos.each { |todo| todo.done! }
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    @list.mark_undone_at(0)
    @list.mark_undone_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo2.done?)
  end

  def test_done_bang
    @list.done!
    @list.to_a.each { |todo| assert_equal(true, todo.done?) }
    assert_equal(true, @list.done? )
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(4) }
    assert_raises(ArgumentError) { @list.remove_at }
    removed = @list.remove_at(0)
    assert_equal(@todo1, removed)
    assert_equal([@todo2, @todo3], @list.to_a) 
  end
end