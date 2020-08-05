


class Text
  attr_reader :text
  def initialize(text)
    @text = text
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end

  def word_count 
    @text.split.count 
  end
end

  def setup
    @file = File.open('./sample_text.txt', 'r')
    @text = Text.new(@file.read)

# expected_text = <<~TEXT.chomp
# Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
# Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
# quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
# nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
# dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
# et verius meuris, et pheretre mi.
# TEXT

# p expected_text.split.count

# new_text = Text.new(text1)
# new_text.swap('e', 'o')
# p new_text.swap('e', 'o')