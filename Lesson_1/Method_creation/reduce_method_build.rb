
# def reduce(array, acc_start = 0)
#   accumulator = acc_start
#   counter = 0
#   while counter < array.size
#     current_item = array[counter]
#     accumulator = yield(accumulator, current_item)
#     counter += 1
#   end
#   accumulator
# end

# p reduce([1, 2, 3], 10) { |acc, num| acc + num }

## Bonus - default initial value is first element of array

def reduce(array)
  accumulator = array[0]
  counter = 1
  while counter < array.size
    current_item = array[counter]
    accumulator = yield(accumulator, current_item)
    counter += 1
  end
  accumulator
end

p reduce(['a', 'b', 'c']) { |acc, value| acc + value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']







