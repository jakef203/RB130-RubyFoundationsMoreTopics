
# def select(array)
#   new_array = []
#   counter = 0
#   while counter < array.size
#     if yield(array[counter])
#       new_array << array[counter] 
#     end
#     counter += 1
#   end
#   new_array 
# end

## Their solution
def select(array)
  new_array = []
  counter = 0
  while counter < array.size
    current_element = array[counter]
    new_array << current_element if yield(current_element)
    counter += 1
  end
  new_array 
end

new = select([1, 2, 3, 4, 5]) { |i| i + 1 }

p new


