
class Luhn
  attr_accessor :number
  DOUBLE_NUMBER = { 0 => 0, 1 => 2, 2 => 4, 3 => 6, 4 => 8, 5 => 1,
                    6 => 3, 7 => 5, 8 => 7, 9 => 9 }
  def initialize(number)
    @number = number
  end

  def addends
    digits = number.to_s.chars.map(&:to_i)
    new_digits = digits.each_with_index.map do |digit, idx|
      if digits.size.even? && idx.even? || digits.size.odd? && idx.odd?
        DOUBLE_NUMBER[digit]
      else
        digit
      end
    end
    new_digits
  end

  def checksum
    addends.inject(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(number)
    new_number = number * 10
    digits = new_number.to_s.chars.map(&:to_i)
    new_luhn = new(new_number)
    if new_luhn.valid?
      new_number
    else
      difference = 10 - (new_luhn.checksum % 10)
      digits[-1] = difference
      digits.join.to_i
    end
  end
end


# ## Their solution
# class Luhn
#   def initialize(number)
#     @digits = number.to_s.split('').map(&:to_i)
#   end

#   def number
#     @digits.map(&:to_s).join.to_i
#   end

#   def addends
#     @digits.reverse.each_with_index.map do |digit, index|
#       if index.even?
#         digit
#       else
#         digit * 2 > 10 ? digit * 2 - 9 : digit * 2
#       end
#     end.reverse
#   end

#   def checksum
#     addends.reduce(&:+)
#   end

#   def valid?
#     checksum % 10 == 0
#   end

#   def self.create(number)
#     new_base_number = number * 10
#     if new(new_base_number).valid?
#       new_base_number
#     else
#       luhn_remainder = new(new_base_number).checksum % 10
#       new_base_number + (10 - luhn_remainder)
#     end
#   end
# end
