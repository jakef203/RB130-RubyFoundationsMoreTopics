

def times(number)
  counter = 0
  while counter < number do 
    yield(counter)
    counter += 1
  end
  number
end

times(4) { |i| puts i }


# def times(time)
#   counter = 0
#   loop do 
#     yield(counter)
#     counter += 1
#     break if counter == time 
#   end
#   time
# end