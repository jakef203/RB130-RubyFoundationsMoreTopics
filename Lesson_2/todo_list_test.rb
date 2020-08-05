require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'todo_list_cp'

class TodoListTest < Minitest::Test 

  def setup 
    @todo1 = Todo.new("Apply for job")
    @todo2 = Todo.new("Buy milk")
    @todo3 = Todo.new("Clean room")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

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
    removed_item = @list.shift
    assert_equal(@todo1, removed_item)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    removed_item = @list.pop
    assert_equal(@todo3, removed_item)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done_question
    expected_result = { 'FFF' => false, 'FFT' => false, 'FTF' => false, 'FTT' => false,
                        'TFF' => false, 'TFT' => false, 'TTF' => false, 'TTT' => true }
    expected_result.keys.each do |combination|
      mapped = combination.each_char.map { |char| char == 'T' ? true : false }
      @todo1.done, @todo2.done, @todo3.done = mapped                 
      assert_equal(expected_result[combination], @list.done?)
    end
  end

  def test_two_done_question
    expected_result = { 'FFF' => false, 'FFT' => false, 'FTF' => false, 'FTT' => true,
                        'TFF' => false, 'TFT' => true, 'TTF' => true, 'TTT' => false }
    expected_result.keys.each do |combination|
      mapped = combination.each_char.map { |char| char == 'T' ? true : false }
      @todo1.done, @todo2.done, @todo3.done = mapped                 
      assert_equal(expected_result[combination], @list.two_done?)
    end
  end

  def test_shovel
    new_todo = Todo.new("Do dishes")
    @todos << new_todo
    @list << new_todo 
    assert_equal(@todos, @list.to_a)
  end

  def test_add_raise_error
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('hi')}
  end

  def test_add
    new_todo = Todo.new("Do dishes")
    @todos << new_todo
    @list.add(new_todo)
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(100) }
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
  end

  def test_start_undone
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end


  def test_mark_done_at
    assert_raises(IndexError) { @list.item_at(100) }
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.item_at(100) }
    @todo1.done!
    @todo2.done!
    @todo3.done!
    @list.mark_undone_at(1)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done_bang
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    @list.remove_at(1)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Apply for job
    [ ] Buy milk
    [ ] Clean room
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_one_done
    @list.mark_done_at(1)
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Apply for job
    [X] Buy milk
    [ ] Clean room
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    @list.done!
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Apply for job
    [X] Buy milk
    [X] Clean room
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each
    # index = 0
    # @list.each do |each_todo|
    #   assert_equal(@todos[index].title, each_todo.title)
    #   index += 1
    # end
    
    ## Their answer, simpler, still actually shows that 'each' is iterating through todos
    result = []
    return_list = @list.each { |todo| result << todo }
    assert_equal([@todo1, @todo2, @todo3], result)
  end

  def test_each_returns_original_list
    assert_equal(@list, @list.each { |todo| nil })
  end

  def test_select
    @todo1.done!
    new_list = TodoList.new(@list.title)
    new_list.add(@todo1) 

    assert_equal(new_list.title, @list.title)
    assert_equal(new_list.to_s, @list.select { |todo| todo.done? }.to_s)
  end

  def test_find_by_title
    assert_equal(nil, @list.find_by_title("Go for a walk"))
    assert_equal(@todo2, @list.find_by_title("Buy milk"))
    @todo4 = Todo.new("Apply for job")
    assert_equal(@todo1, @list.find_by_title("Apply for job"))
  end

  def test_all_done
    @todo1.done!
    @todo2.done!
    new_list = TodoList.new(@list.title)
    new_list.add(@todo1) 
    new_list.add(@todo2)

    assert_equal(new_list.title, @list.title)
    assert_equal(new_list.to_s, @list.all_done.to_s)
  end

  def test_all_not_done
    @todo1.done!
    new_list = TodoList.new(@list.title)
    new_list.add(@todo2) 
    new_list.add(@todo3)

    assert_equal(new_list.title, @list.title)
    assert_equal(new_list.to_s, @list.all_not_done.to_s)
  end

  def test_mark_done1
    @list.mark_done("Go for a walk")
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Apply for job
    [ ] Buy milk
    [ ] Clean room
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_mark_done2
    @list.mark_done("Buy milk")
    assert_equal(true, @todo2.done?)
  end

  def test_mark_done3
    @todo4 = Todo.new("Apply for job")
    @list.add(@todo4)
    @list.mark_done("Apply for job")
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Apply for job
    [ ] Buy milk
    [ ] Clean room
    [ ] Apply for job
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_mark_undone1
    @todo1.done!
    @todo2.done!
    @todo3.done!
    @list.mark_undone("Go for a walk")
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Apply for job
    [X] Buy milk
    [X] Clean room
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_mark_undone2
    @todo1.done!
    @todo2.done!
    @todo3.done!
    @list.mark_undone("Buy milk")
    assert_equal(false, @todo2.done?)
  end

  def test_mark_undone3
    @todo1.done!
    @todo2.done!
    @todo3.done!
    @todo4 = Todo.new("Apply for job")
    @list.add(@todo4)
    @todo4.done!
    @list.mark_undone("Apply for job")
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Apply for job
    [X] Buy milk
    [X] Clean room
    [X] Apply for job
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_mark_all_done
    @list.mark_all_done 
    @list.each { |todo| assert_equal(true, todo.done?) }
  end

  def test_mark_all_not_done
    @list.each { |todo| assert_equal(false, todo.done?) }
    @list.mark_all_done
    @list.mark_all_undone 
    @list.each { |todo| assert_equal(false, todo.done?) }
  end



end
  



  # def test_practice  # This just shows that objects in @todos and @list.todos are the same
    
  #   # @todo1.done = true
  #   assert_equal(false, @todos[0].done)
  #   assert_equal(false, @list.todos[0].done)
  #   # assert_equal(@todos, @list.to_a)
  # end






