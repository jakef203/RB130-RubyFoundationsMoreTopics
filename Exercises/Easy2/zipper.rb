
def zip1(arr1, arr2)

  result = []
  counter = 0
  while counter < arr1.size
    result << [arr1[counter], arr2[counter]]
    counter += 1
  end
  result 
end

def zip2(arr1, arr2)
  result = []
  arr1.each_with_index do |item, idx|
    result << [item, arr2[idx]]
  end
  result
end

def zip3(arr1, arr2)
  arr1.each_with_index.with_object([]) do |(item, idx), result|
    result << [item, arr2[idx]]
  end
end

p zip2([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
