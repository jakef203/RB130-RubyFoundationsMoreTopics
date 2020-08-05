
def step(begin_value, end_value, increment)
  current = begin_value
  result = []
  loop do 
    break if current > end_value 
    result << yield(current)
    # result << yield
    current += increment 
  end
  result 
end

step(1, 10, 3) { |value| puts "value = #{value}" }

