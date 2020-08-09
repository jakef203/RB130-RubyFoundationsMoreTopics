## Like solution 1 in octal.rb, but can change BASE to 16
class Hex
  BASE = 16
  INVALID_OCTAL = /\H/

  attr_reader :octal_string

  def initialize(octal_string)
    @octal_string = octal_string
  end

  def to_decimal
    octal_string =~ INVALID_OCTAL ? 0 : calculate
  end

  private

  def calculate
    decimal = 0
    octal_string.reverse.each_char.with_index do |char, index|
      decimal += char_to_value(char) * (16 ** index)
    end
    decimal
  end

  def char_to_value(ch)
    case ch.upcase
    when 'A' then 10
    when 'B' then 11
    when 'C' then 12
    when 'D' then 13
    when 'E' then 14
    when 'F' then 15
    else          ch.to_i
    end
  end

end

# def calculate(string)
#   decimal = 0
#   string.reverse.each_char.with_index do |char, index|
#     decimal += char_to_value(char) * (16 ** index)
#   end
#   decimal
# end
# def char_to_value(ch)
#   case ch.upcase
#   when 'A' then 10
#   when 'B' then 11
#   when 'C' then 12
#   when 'D' then 13
#   when 'E' then 14
#   when 'F' then 15
#   else          ch.to_i
#   end
# end

# p calculate('2B1')
