
## My solution, works as defined in ruby docs
# def each_cons(array, section_size)
#   # return nil if section_size > array.size
#   last_index = array.size - section_size
#   return nil if last_index < 0
#   (0..last_index).each do |idx|
#     yield(array[idx, section_size])
#   end
#   nil
# end
# (1..10).each_cons(3) { |a| p a }

## My solution for their test cases

def each_cons(array, section_size = 2)
  # return nil if section_size > array.size
  last_index = array.size - section_size
  return nil if last_index < 0
  (0..last_index).each do |idx|
    small_array = array[idx, section_size]
    yield(small_array[0], small_array[1])
  end
  nil
end
## Their solution, a more simplified version of just using size 2
def each_cons(array)
  array.each_with_index do |item, index|
    break if index + 1 >= array.size
    yield(item, array[index + 1])
  end
  nil
end


hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil




