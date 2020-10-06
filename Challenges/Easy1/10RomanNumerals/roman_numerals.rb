
# class Roman 

#   PLACES_TO_NUMERALS = { thousands:{ 1 => 'M' }, 
#                          hundreds: { 1 => 'C', 4 => 'CD', 5 => 'D', 9 => 'CM' },
#                          tens:     { 1 => 'X', 4 => 'XL', 5 => 'L', 9 => 'XC' },
#                          ones:     { 1 => 'I', 4 => 'IV', 5 => 'V', 9 => 'IX' }
#                        }
#   attr_accessor :digits
#   def initialize(integer)
#     integer = integer.to_s
#     if integer.size < 4
#       integer.prepend('0' * (4 - integer.size))
#     end
#     @digits = integer.chars.map(&:to_i)
#   end
  
#   def to_roman
#     places_array = [:thousands, :hundreds, :tens, :ones]
    
#     places_array.zip(digits).map! do |place, digit|
#       digit_to_numerals(place, digit.to_i)
#     end.join
#   end

#   private

#   def digit_to_numerals(place, digit)
#     case digit
#     when 1, 4, 5, 9 then PLACES_TO_NUMERALS[place][digit] 
#     when 2, 3       then PLACES_TO_NUMERALS[place][1] * digit   
#     when 6, 7, 8    then PLACES_TO_NUMERALS[place][5] + PLACES_TO_NUMERALS[place][1] * (digit - 5)
#     when 0          then ''
#     end
#   end
# end

class Roman 

  attr_accessor :digits
  
  HUNDREDS = %w(C CC CCC CD D DC DCC DCCC CM)
  TENS = %w(X XX XXX XL L LX LXX LXXX XC)
  ONES = %w(I II III IV V VI VII VIII IX)
  
  def initialize(integer)
    integer = integer.to_s
    if integer.size < 4
      integer.prepend('0' * (4 - integer.size))
    end
    @digits = integer.chars.map(&:to_i)
  end
  
  def to_roman
  
    thousands_numerals = 'M' * digits[0]
    numerals_array = [HUNDREDS, TENS, ONES]
    last_3_digits = (digits[1..3].zip(numerals_array).map do |digit, array| 
      digit == 0 ? '' : array[digit - 1]
    end).join
    thousands_numerals + last_3_digits
  end

end

