# def each(array)

#   0.upto(array.size - 1) { |i| yield(array[i]) }
#   # index = 0
#   # until index > array.size - 1
#   #   yield(array[index])
#   #   index += 1
#   # end
# end

# each([1, 2, 3, 4]) { |k| puts k }

# idx = 2
# [1, 2, 3].each do |num|
#   idx += 1
#   puts idx 
#   puts num
# end

# def times(num)

#   counter = 0
#   loop do 
#     break if counter == num 
#     yield(counter)
#     counter += 1
#   end
#   num
# end

def test2(block)
  puts "hello"
  block.call                    # calls the block that was originally passed to test()
  puts "good-bye"
end

def test(&block)
  block.call
  puts "1"
  test2(block)
  puts "2"
end

test { puts "xyz" }
# => 1
# => hello
# => xyz
# => good-bye
# => 2




