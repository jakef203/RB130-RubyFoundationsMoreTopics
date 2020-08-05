

def missing(arr)
  return [] if arr.size == 1
  current_num = arr[0] + 1
  last_num = arr[-1]
  result = []
  until current_num == last_num do
    result << current_num if !arr.include?(current_num)
    current_num += 1
  end
  result 
end
## Their solution
def missing(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end



p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

# def new(arr)
#   return "yep" if arr.size == 1
#   return arr
# end

# p new([1, 2])