## Example 1
def hello(v1, *v2)
  p v1
  p v2 
end

arr = [1, 2, 3, 4]
hello(arr)  # prints [1, 2, 3, 4], []

## Example 2
def hello(v1, *v2)
  p v1
  p v2 
end

arr = [1, 2, 3, 4]
hello(*arr)  # prints 1, [2, 3, 4]

## Example 3
def hello(v1, v2, v3, v4)
  p v1  # prints 1
  p v2  # prints 2
  p v3  # prints 3
  p v4  # prints 4
end

arr = [1, 2, 3, 4]
hello(*arr)  # prints [1, 2, 3, 4], []


v3, *v4 = [2, 3, 4]
p v3 # prints 2
p v4 # prints [3, 4]


