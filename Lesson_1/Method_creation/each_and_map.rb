
def each(arr)
  counter = 0
  while counter < arr.size
    yield(arr[counter])
    counter += 1
  end
  arr
end

def map(arr)
  result = []
  alpha = "hi" 
  each(arr) do |item|
    result << yield(item)
    puts alpha
  end
  result
end


p map([1, 2, 3, 4]) { |i| "#{i + 1}" }
# def map(arr)