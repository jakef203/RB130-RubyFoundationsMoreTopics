
class Trinary
  attr_reader :string_trinary
  
  BASE = 3

  INVALID_STRING = /[^0-2]/
  
  def initialize(string_trinary)
    @string_trinary = string_trinary
  end

  def to_decimal
    string_trinary =~ INVALID_STRING ? 0 : calculate
  end

  private 

  def calculate
    decimal = 0
    string_trinary.chars.reverse.each_with_index do |digit, idx|
      decimal += digit.to_i * BASE**(idx)
    end
    decimal
  end

end




