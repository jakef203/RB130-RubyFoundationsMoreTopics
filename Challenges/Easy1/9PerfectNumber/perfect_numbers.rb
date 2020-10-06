
def time_it
  time_before = Time.now
  yield
  time_after = Time.now

  puts "It took #{time_after - time_before} seconds."
end
## My solution
class PerfectNumber

  def self.classify(number)
    raise StandardError if number <= 0
    return 'perfect' if number == 1
    
    sum_factors = find_factors(number).inject(:+)
    if sum_factors == number 
      'perfect'
    elsif sum_factors < number
      'deficient'
    else
      'abundant'
    end
  end

  private

  def self.find_factors(number)
    array1 = []
    array2 = []
    counter = 2
    quotient = number
    until counter >= quotient
      if number % counter == 0
        quotient = number / counter
        array1 << counter
        array2.unshift(quotient)
      end
      counter += 1
    end
    ([1] + array1 + array2).uniq
  end
end

## Their top solution1, much slower than mine
class PerfectNumber2
  def self.classify(number)
    raise StandardError if number < 0

    factors = (1...number).select { |num| number % num == 0 }

    result = factors.reduce(:+)

    case
      when result < number then 'deficient'
      when result > number then 'abundant'
      when result == number then 'perfect'
    end
  end
end

# time_it { PerfectNumber1.classify(16) }
# p PerfectNumber1.classify(16)
# time_it { PerfectNumber2.classify(1000000000) }

