## My solution

class PigLatin

  def self.translate(phrase)
    words_array = phrase.split(' ')
    words_array.map! do |word|
      to_piglatin(word)
    end
    words_array.join(' ')
  end

  private 

  def self.to_piglatin(word)

    if word[0, 3].match(/(squ|thr|sch)/)
      word[3..] + word[0, 3] + 'ay'
    elsif word[0, 2].match(/(ch|qu|th)/)
      word[2..] + word[0, 2] + 'ay'
    elsif word.match(/\b([aeiou]|yt|xr)/)
      word + 'ay'
    elsif word[0].match(/[a-z&&[^aeiou]]/)
      word[1..] + word[0] + 'ay'
    end
  end
end

## LS main solution
# class PigLatin
#   def self.translate(phrase)
#     phrase.split(' ').map do |word|
#       translate_word(word)
#     end.join(' ')
#   end

#   def self.translate_word(word)
#     if begins_with_vowel_sound?(word)
#       word + 'ay'
#     else
#       consonant_sound, the_rest_of_word = parse_for_consonant(word)
#       the_rest_of_word + consonant_sound + 'ay'
#     end
#   end

#   def self.begins_with_vowel_sound?(word)
#     word.match(/\A[aeiou]|[xy][^aeiou]/)
#   end

#   def self.parse_for_consonant(word)
#     consonant_split = /\A([^aeiou]*qu|[^aeiou]+)([aeiou].*)\z/.match(word)
#     [consonant_split[1], consonant_split[2]]
#   end
# end


## Solution1  - I like this solution, after understanding it now
# class PigLatin
#   def self.translate(string)
#     string.split(" ").each do |word|
#       if word.scan(/^[aeiou]|^(y|x)[^aeiou]+/).empty?
#         word << word.slice!(/^[^aeiouq]*(qu)*/)
#       end
#       word << "ay"
#     end
#     .join(" ")
#   end
# end
# p 'apple'.scan(/^[^aeiouq]*(qu)*/)
# p "cruel world".scan(/(..)(..)/)

# p /\A([^aeiou]*qu|[^aeiou]+)([aeiou].*)\z/.match('square')
# h = 'quarel'.match(/\A([^aeiou]*qu|[^aeiou]+)([aeiou].*)([lo])\z/)
# p h

# hex = "12a4:fad3:4ac9:249d"
# nums = hex.match(/\A(\h{4}):(\h{4}):(\h{4}):(\h{4})\z/)
# p nums[1]