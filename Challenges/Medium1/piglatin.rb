
class PigLatin

  # def initialize(phrase)
  #   @phrase = phrase.split
  # end

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

p 'q'.match(/[a-p&&[l-z]]/)