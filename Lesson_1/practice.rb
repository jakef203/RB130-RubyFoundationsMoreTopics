def each(array)
  idx = 0
  while idx < array.size
    yield(array[idx])
    idx += 1
  end
  array
end

def select(array)
  idx = 0
  result = []
  while idx < array.size 
    result << array[idx] if yield(array[idx])
    idx += 1
  end
  result
end

# p select([1, 2, 3, 4, 5]) { |i| puts i }
# ret = each([1, 2, 3]) { |i| puts i }.select { |num| num.odd? }
# p ret

def reduce(array, start = 0)
  sum = start
  idx = 0
  while idx < array.size
    sum = yield(sum, array[idx])
    idx += 1
  end
  sum 
end 

p reduce([1, 2, 3, 4, 5, 6]) { |acc, num| acc + num }



# def compare(word)
#   puts "Output"
#   puts "Before: #{word}"
#   if block_given?
#     puts "After: #{yield(word)}"
#   else
#     puts "After: #{word}"
#   end
# end

def compare1(str)
  puts "Before: #{str}"
  after = yield(str)
  puts "After: #{after}"
end

a_proc = Proc.new { |word| word.capitalize }

# compare1("hello there")
compare1("hello there", &a_proc) #{ |word| word.upcase }

