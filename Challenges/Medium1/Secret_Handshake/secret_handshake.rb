
## Take an integer.
## first divide by 16( the divider), 
##   if quotient is 1 add 1 to binary_string
##     new_number is number % divider.
##   If quotient is 0 then add that to binary_string, keep same number

## If argument is a string it is assumed to be in binary already
## If size of binary_string is less than 5, add (5-string.size) 0s to the front of it

## Have an array of actions [ 'jump', 'close your eyes', 'double blink', 'wink']
## If the first one is a one reverse the array
## Iterate through action.zip(binarystring.chars)
##  If the number is 1 then add action to a new array, 
##  Return the array


class SecretHandshake
  attr_accessor :number
  def initialize(number)
    @number = number
  end

  def commands

    binary_string = number.class == Integer ? to_binary(number) : number
    return [] if binary_string.match(/[^01]/)
    if binary_string.size < 5
      binary_string.prepend('0' * (5 - (binary_string.size)))
    end
    
    action_array = ['wink', 'double blink', 'close your eyes', 'jump']
    action_digit = binary_string[1..].reverse.chars
    array = action_array.zip(action_digit).each_with_object([]) do |(action, digit), arr|
      arr << action if digit == '1'
    end
    array.reverse! if binary_string[0] == '1'
    array
  end

  private 

  def to_binary(number)
    binary_string = ''
    divisor = 16
    current_number = number
    until divisor == 0
      new_digit = current_number / divisor 
      binary_string << new_digit.to_s
      current_number = current_number % divisor 
      divisor /= 2
    end
    binary_string
  end
end




# a.prepend('0' * (5 - a.size))