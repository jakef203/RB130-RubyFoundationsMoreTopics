
items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

## Part 1
# gather(items) { |produce| puts produce.join(', ') }

# gather(items) do |produce|
#   puts "We've gathered some vegetables: #{produce[1]} and #{produce[2]}"
# end


## Part 3
# Q1
gather(items) do |*produce, wheat|
  puts produce.join(', ')
  puts wheat
end

# Q2
gather(items) do |apples, *vegetables, wheat|
  puts apples
  puts vegetables.join(', ')
  puts wheat
end

# Q3
gather(items) do |apples, *assorted |
  puts apples
  puts assorted.join(', ')
end

# Q4
gather(items) do |apples, corn, cabbage, wheat |
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end



