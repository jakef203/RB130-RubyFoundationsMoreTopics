
## Slices will give an integer for desired slice size.  
# First if slice_size > string_digits.size, raise an ArgumentError
# Otherwise:
# Create a return array called result = []  
# Start at index 0 go up to ending_index calculated by string_size - slice_number
  # For each starting index, take a slice of the array of slice_number size
  # append that slice onto the result
  # return the result after iteration is done
  #

## My solution
# class Series
#   def initialize(string_digits)
#     @string_digits = string_digits
#   end

#   def slices(slice_number)
#     string_size = @string_digits.size
#     raise ArgumentError if slice_number > string_size
#     ending_index = string_size - slice_number
#     array_digits = @string_digits.chars.map(&:to_i)
#     result = []
#     0.upto(ending_index) do |idx|
#       result << array_digits[idx, slice_number]
#     end
#     result
#   end

# end

# Top Solution

# class Series
#   attr_reader :numbers

#   def initialize(string)
#     @numbers = string.each_char.map(&:to_i)
#   end

#   def slices(count)
#     fail ArgumentError.new("Slice is longer than input.") if count > numbers.length
#     numbers.each_cons(count).to_a
#   end
# end

# # Solution 2
# class Series
#   attr_reader :string_of_digits

#   def initialize(string_of_digits)
#     @string_of_digits = string_of_digits
#   end

#   def slices(n)
#     raise ArgumentError, 'n is too big for the string.' if n > string_of_digits.size
#     string_of_digits.each_char.map(&:to_i).each_cons(n).to_a

#     ### original implementation
#     # result = []
#     # arr = string_of_digits.split('').map(&:to_i)
#     # while arr.size >= n
#     #   result << arr.take(n)
#     #   arr.reverse!.pop
#     #   arr.reverse!
#     # end
#     # result
#   end
# end

#  Solution 3
class Series
  attr_reader :series

  def initialize(series)
    @series = series.chars.map(&:to_i)
  end

  def slices(slice_size)
    validate_input(slice_size)

    0.upto(series.size - slice_size).map { |position| series.slice(position, slice_size) }
  end

  private

  def validate_input(size)
    fail(ArgumentError, 'too big') if size > series.size
  end
end



  