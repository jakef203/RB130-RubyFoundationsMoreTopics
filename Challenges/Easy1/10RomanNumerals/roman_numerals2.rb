## This converts numerals in strings to integer, opposite of original exercise


## Convert each of the numrals into integer values
## Make an array of integer values
## Iterate through values, set value to array position 0
## Start at idx = 1, iterate through rest of integers
## If current_value is 

class RomanNumerals

  NUMERALS_TO_INT = { 'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50, 
                      'C' => 100, 'D' => 500, 'M' => 1000 }
  
  def self.to_integer(string)
    raise ArgumentError, "Must be a string" unless string.is_a?(String)
    raise ArgumentError, "Incorrect Numeral" if string.match(/[^IVXLCDM]/)
    int_array = string.chars.map { |char| NUMERALS_TO_INT[char] }
    
    sum = int_array[0]
    prev_val = int_array[0]
    int_array[1..].each_with_index do |cur_val, idx|
      if cur_val <= prev_val 
        sum += cur_val 
      else
        sum = sum - (2 * prev_val) + cur_val
      end
      prev_val = cur_val
    end
    sum
  end
end

