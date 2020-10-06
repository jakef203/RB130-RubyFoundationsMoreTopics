
def test2(block)
  puts "test2 hello"
  block.call                    # calls the block that was originally passed to test()
  puts "test2 goodbye"
end

def test(&block)
  puts "test hello"
  test2(block)
  puts "test goodbye"
end

test { puts "block call" }

# my_hash = { a: 3, b: 2, c: 5 }

# def test(num)
#   num += 2
# end

# arr = ['a', 'b', 'c' ]
# arr1 = ['1', '2', '3']

# def convert(collection)
#   collection.map do |el|
#     yield(el)
#   end
# end

# a = convert(arr) do |i|
#   p i.object_id
#   i * 2
#   # block body
# end
# p a
# p arr
# p arr[0].object_id
# def mutate_me(array, &block)
#   if block_given?
#     array.map! do |item| 
#       block.call(item)
#     end
#   else
#     array
#   end
# end
 
# p mutate_me([1, 2, 3]) { |el| el + 5 }
# arr = [1,2,3]
# mutated_arr = mutate_me(arr) { |el| el + 5 } # [6,7,8]
# p arr.object_id == mutated_arr.object_id # true

# p mutate_me(['a','b','c']) { |el| el.upcase } # ['A', 'B', 'C']

# p mutate_me([[1,2], [2,3], [3,4], 'a', 'b', 'c']) do |el|
#   if el.is_a?(Array)
#     el.reverse
#   else
#     el
#   end
# end
#  [[2, 1], [3, 2], [4, 3], "a", "b", "c"]

# my_hash = { a: 3, b: 2, c: 5 }

# def test(num)
#   num += 2
# end

# arr = ['a', 'b', 'c' ]

# def convert(collection)
#   collection.map do |el|
#     yield(el)
#   end
# end

# p convert(arr) do |i|
#   i
# end
# require 'minitest/autorun'
# require "minitest/reporters"
# Minitest::Reporters.use!

# require_relative 'player'

# class PlayerTest < MiniTest::Test

#   def setup
#     @initial_health = 100
#     @player = Player.new("john", @initial_health)
#     @default_player = Player.new("jane")
#   end

#   def test_name_is_capitalized
#     assert_equal(@player.name, 'John')
#   end

#   def test_health
#     assert_equal(@player.health, @initial_health)
#     assert_equal(@default_player.health, 50)
#   end

#   def test_to_s
#     assert_equal(@player.to_s, "I'm John with health = 100.")
#     @player.health = -1
#     assert_equal(@player.to_s, "I was John, now I am dead :(.")
#   end

#   def test_raises_error
#     @player.health = -1
#     assert_raises(NoMethodError) { @player.boost }
#     assert_raises(NoMethodError) { @player.hurt }
#   end

#   def test_boost
#     @player.boost
#     assert_equal(@player.health, @initial_health + 20)
#   end

#   def test_hurt
#     @player.hurt
#     assert_equal(@player.health, @initial_health - 10)
#   end

#   def test_dead?
#     @player.health = -1
#     assert(@player.dead?)
#   end
# end


# class Car
#   attr_accessor :wheels, :name

#   def initialize
#     @wheels = 4
#   end

#   def ==(other)
#     wheels == other.wheels 
#   end
# end

# class CarTest < MiniTest::Test
#   def test_value_equality
#     car1 = Car.new
#     car2 = Car.new

#     car1.name = "Bob"
#     car2.name = "Bob"

#     assert_equal(car1, car2)
#   end
# end


# class Rectangle
#   attr_accessor :height, :width, :color

#   def initialize
#     if block_given?
#       yield(self)
#     else
#       @height = 50
#       @width = 50
#       @color = :red
#     end
#   end

#   def to_s
#     "#{height}x#{width} #{color} rectangle"
#   end
# end

# rect = Rectangle.new
# puts rect # => 50x50 red rectangle

# rect1 = Rectangle.new do |r|
#   r.height = 400
#   r.width = 300
#   r.color = :black
# end

# puts rect1 # => 400x300 black rectangle

# def mutate_me(array, &block)
#   new_array = []
#   array.each { |item| new_array << block(item).call }
# end

# # mutate_me([1, 2, 3])
# arr = [1,2,3]
# mutated_arr = mutate_me(arr) { |el| el + 5 } # [6,7,8]
# arr.object_id == mutated_arr.object_id # true

# def display_message(str)
#   yield(str)
#   puts str
# end

# display_message("hello") { |str| str.upcase! }

# p [1, 3, 5, 7, 9, 11].all?(&:odd?)

# def timer
#   if block_given?
#     time_before = Time.now
#     100000000.times { |i| yield(i) }
#     time_after = Time.now

#     puts "#{time_after - time_before} seconds."
#   else 
#     raise RuntimeError, "No block given"
#   end
# end

# timer { |x| i = x.to_s } # 1.731092053 seconds

# timer # No block given (RuntimeError)






# p mutate_me(['a','b','c']) { |el| el.upcase } # ['A', 'B', 'C']

# p mutate_me([[1,2], [2,3], [3,4], 'a', 'b', 'c']) do |el|
#   el.is_a?(Array) ? el.reverse : el
# end

# def test(some_code)
#   some_code.call
# end
# # name = nil
# introduction = Proc.new { puts "My name is #{name}" }
# name = "John"
# test(introduction)

# def func
#   puts "hi"
#   yield(1)
# end

# func do |a, b|
#   puts a   #> Outputs 1
#   p b        #> Outputs nil
# end

# def func
#   yield(1, 2)
# end

# func { |a| puts a }   #> Outputs 1, ignores '2' argument
