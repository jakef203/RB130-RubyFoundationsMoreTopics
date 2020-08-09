def timeit
  before = Time.now
  yield
  after = Time.now
  puts "It took #{after - before} seconds."
end


class Octal 
  attr_reader :number
  def initialize(number)
    @number = number
  end

  def to_decimal
    return 0 if number.match(/[^0-7]/)
    digits = number.chars.map(&:to_i)
    exponents = (digits.size - 1).downto(0).to_a 
    sum = 0
    digits.zip(exponents).each { |digit, exp| sum += digit * 8**exp }
    sum
  end
end


## Solution1 - I like this, very well done, I like the way he reversed it, simple

# class Octal
#   BASE = 8
#   INVALID_OCTAL = /\D|[8-9]/

#   attr_reader :octal_string

#   def initialize(octal_string)
#     @octal_string = octal_string
#   end

#   def to_decimal
#     octal_string =~ INVALID_OCTAL ? 0 : calculate
#   end

#   private

#   def calculate
#     decimal = 0
#     octal_string.reverse.each_char.with_index do |char, index|
#       decimal += char.to_i * (BASE ** index)
#     end
#     decimal
#   end

# end

