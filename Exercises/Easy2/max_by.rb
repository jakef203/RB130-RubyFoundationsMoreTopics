
def max_by(arr)

  return nil if arr.size == 0
  max_item = nil
  arr.each_with_index do |item, idx| 
    if idx == 0
      max_item = item
    else
      max_item = item if yield(item) > yield(max_item) 
    end
  end
  max_item
end

## Their solution
def max_by(arr)
  return nil if arr.empty?
  max_element = arr.first
  largest = yield(max_element)

  arr[1..-1].each do |element|
    yielded_value = yield(element)
    if largest < yielded_value 
      max_element = element 
      largest = yielded_value
    end
  end
  max_element 
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil