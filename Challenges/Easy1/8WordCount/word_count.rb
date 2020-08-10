
## After splitting then map with downcase

class Phrase 
  
  def initialize(phrase)
    # @words = phrase.split(/'?[^a-z0-9']+'?/i).map!(&:downcase)  # Originally used this
    @words = phrase.scan(/\b[\w']+\b/).map!(&:downcase)
  end

  def word_count 
    @words.each_with_object(Hash.new(0)) { |word, hash| hash[word] += 1 }
  end

end

## Solution 1
# class Phrase
#   def initialize(words)
#     @words = words
#   end

#   def word_count
#     count = Hash.new(0)

#     @words.scan(/\b[\w']+\b/) do |word|
#       count[word.downcase] += 1
#     end

#     count
#   end
# end



