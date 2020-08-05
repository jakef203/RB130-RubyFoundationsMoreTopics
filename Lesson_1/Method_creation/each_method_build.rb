
def each(array)
  size = array.size 
  idx = 0
  while idx < size  
    yield(array[idx])
    idx += 1
  end
  array
end

# each([1, 2, 3, 4]) { |i| puts i }

new = each([2, 4, 5, 6]) { |i| puts i }.select { |i| i.odd? }

p new