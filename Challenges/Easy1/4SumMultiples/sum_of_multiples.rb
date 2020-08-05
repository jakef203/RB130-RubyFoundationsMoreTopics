
## Take input of array_nums
## Default to [3,5] if no array is given
## Function <to> takes a number called 'limit'
## Initialize total to 0
## For each num in 'array_nums', calculate multiples up to but not greater than limit
## For each multiple, add to total
## If a num in array_nums is greater than limit, go to next num in array

def timeit
  before = Time.now
  yield
  after = Time.now
  puts "It took #{after - before} seconds."
end

# ## My original answer
class SumOfMultiples1
  attr_reader :factors
  def initialize(*factors)
    @factors = factors
  end

  def self.to(limit)
    SumOfMultiples1.new(3, 5).to(limit)
  end

  def to(limit)
    multiples_array = []
    factors.each do |factor|
      next if factor > limit
      multiplier = 1
      loop do 
        multiple = multiplier * factor 
        if multiple < limit
          multiples_array << multiple unless multiples_array.include?(multiple)
          multiplier += 1
        else
          break
        end
      end
    end
    multiples_array.sum
  end
end

# ## Solution1, not as fast as mine, the higher the limit or lower the factors, the slower it performs
# ## When using my solution for the same, limit, it goes faster with higher factors
# ## Their solution1 doesn't change performance when changing numbers with the same limit since it still
# ## iterates from 0 to limit and asks if it's a multiple of at least one of the given numbers
class SumOfMultiples2
  def self.to(limit, multiples = [3, 5])
    (0...limit).select do |number|
      multiples.any? { |multiple| number % multiple == 0 }
    end.reduce(:+)
  end

  def initialize(*multiples)
    @multiples = multiples
  end

  def to(limit)
    self.class.to(limit, @multiples)
  end
end

# class SumOfMultiples ## I adjusted their Solution2, using variable 'factors' instead of 'multiples'

#   def initialize(*factors)
#     @factors = factors
#   end

#   def self.to(limit)
#     SumOfMultiples.new(3, 5).to(limit)
#   end

#   def to(limit)
#     (0...limit).select { |num| multiple?(num) }.reduce(:+)
#   end

#   private

#   def multiple?(num)
#     @factors.any? { |factor| num % factor == 0 }
#   end
# end

# sum1 = SumOfMultiples1.new
# sum2 = SumOfMultiples2.new
timeit { SumOfMultiples1.to(10000) }
timeit { SumOfMultiples1.new(50, 60, 70).to(10000) }
timeit { SumOfMultiples1.new(1111).to(10000) }
timeit { SumOfMultiples2.to(10000) }
timeit { SumOfMultiples2.new(50, 60, 70).to(10000) }
timeit { SumOfMultiples2.new(1111).to(10000) }


