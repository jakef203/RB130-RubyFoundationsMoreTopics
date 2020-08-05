
# One array - first half of return result
# Second array - second half of return result
# Push 1 onto first_half_result
# Push dividend onto second_half_result
# Variable called current_num, 
  # Start at 2 check if it's a divisor of dividend using dividend % current_num
  # If true then push current_num to first_half_result
  # divide dividend by divisor get 2nd_divisor, put that on second_half_result using unshift
  # Increment current_num by 1
  # break if current_num is greater than second_half_result[0]
#
# Add first_half_result to second_half_result
# Return final_result
# Push 1 ont

def time_it
  time_before = Time.now
  yield
  time_after = Time.now

  puts "It took #{time_after - time_before} seconds."
end

def divisors_1(dividend)
  result = []
  1.upto(dividend) do |current_num|
    result << current_num if dividend % current_num == 0
  end
  result
end

## Further Exploration answer
def divisors_2(dividend)
  return [1] if dividend == 1
  first_half_result = [1]
  second_half_result = [dividend]
  current_num = 2
  loop do 
    break if current_num >= second_half_result[0]
    if dividend % current_num == 0
      first_half_result << current_num
      second_half_result.unshift(dividend / current_num)
    end
    current_num += 1
  end
  (first_half_result + second_half_result).uniq
end
# p divisors_mine(100) 
# puts "Theirs"
time_it { divisors_1(1) }
time_it { divisors_1(7) }
time_it { divisors_1(12) }
time_it { divisors_1(98) }
time_it { divisors_1(1000000) }
time_it { divisors_1(99400891) }
puts "mine"
time_it { divisors_2(1) }
time_it { divisors_2(7) }
time_it { divisors_2(12) }
time_it { divisors_2(98) }
time_it { divisors_2(1000000) }
time_it { divisors_2(99400891) }
time_it { divisors_2(999962000357)}

# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] 


