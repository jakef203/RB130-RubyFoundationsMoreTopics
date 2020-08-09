
class Anagram

  def initialize(word)
    @original_word = word.downcase
    @ordered_letters = order_word(word)
  end

  def match(test_words)
    test_words.select do |word| 
      @ordered_letters == order_word(word) && @original_word != word.downcase
    end 
  end

  private 

  def order_word(word)
    word.chars.map(&:downcase).sort
  end
end

## Top solution
# class Anagram
#   def initialize word
#     @original_word = word
#     @letters = letters @original_word
#   end

#   def match possibilities
#     possibilities.sort.select { |word| anagram? word }
#   end

#   private

#   def anagram? word
#     @letters == letters(word) && @original_word != word.downcase
#   end

#   def letters word
#     word.downcase.chars.sort
#   end
# end


