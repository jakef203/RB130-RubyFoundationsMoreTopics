
## Given a limit lim.
# Create an array of numbers from 1 to lim => result = (2..limit).to_a
# starting at 2 as number:
## Check if number is in result_array
## If yes then it's prime
##   Multiply number * 2 up until number * value > limit
##   For each of these numbers remove them from result
## If number is not in result_array then go to next number
## Stop when you reach limit/2.0.ceil

## 100/2.0 = 50.0.ceil => 50 101/2.0 = 50.5 51
# require 'pry'
def timeit
  before = Time.now
  yield
  after = Time.now
  puts "It took #{after - before} seconds."
end
# ## My original solution
# class SieveOriginal
  
#   attr_reader :limit
#   def initialize(limit)
#     @limit = limit 
#   end

#   def primes 

#     result_array = (2..limit).to_a 
#     test_number = 2 
#     until test_number >= (limit/2.0).ceil
#       if result_array.include?(test_number)
#         multiplier = 2
#         until test_number * multiplier > limit 
#           composite = test_number * multiplier 
#           result_array.delete(composite)
#           multiplier += 1
#         end
#       end
#       test_number += 1
#     end
#     result_array
#   end
# end

class SieveMine
  attr_reader :range

  def initialize(last_num)
    @range = (2..last_num).to_a
  end

  def primes
    range.each_with_index do |prime, idx|
      range[range.index(prime)..].each do |num| 
        range.delete(num) if num % prime == 0 && num != prime
      end
    end
    range
  end
end

## Solution 1
class Sieve1
  attr_reader :range

  def initialize(last_num)
    @range = (2..last_num).to_a
  end

  def primes
    range.each do |prime|
      range.reject! do |num|
        (num != prime) && (num % prime == 0) 
      end
    end
    range
  end
end

# ## Solution 2
class Sieve2
  attr_reader :numbers

  def initialize(limit)
    @numbers = [*(2..limit)]
  end

  def primes
    primes = []

    while (prime = numbers.delete_at(0))
      primes << prime
      numbers.delete_if { |number| number % prime == 0 }
    end

    primes
  end
end

# ## Solution3
# class Sieve3

#   FIRST_PRIME = 2

#   def initialize(limit)
#     @limit = limit
#   end

#   def primes
#     raise(ArgumentError) if @limit < FIRST_PRIME

#     range = (FIRST_PRIME..@limit)
#     primes = range.to_a

#     range.each do |t|
#       primes.reject! { |number| (number % t == 0) unless number == t }
#     end

#     primes
#   end
# end

sieve = SieveMine.new(10000)
sieve1 = Sieve1.new(10000)
sieve2 = Sieve2.new(10000)
# p sieve.primes.size
# p sieve1.primes.size

# sieve1 = Sieve1.new(100000)
# sieve2 = Sieve2.new(100000)
# sieve3 = Sieve3.new(100000)


timeit { sieve.primes }
timeit { sieve1.primes }
timeit { sieve2.primes }
# timeit { sieve3.primes }


