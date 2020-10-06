class Cipher
  def self.rotate(string, offset)
    chars = string.chars
    chars.map! do |char|
      char.match(/[a-zA-Z]/) ? new_letter(char, offset) : char
    end.join
  end

  def self.new_letter(char, offset)
    new_ord = char.ord + offset
    if char.match(/[a-z]/) && new_ord > 122 ||
       char.match(/[A-Z]/) && new_ord > 90
      new_ord -= 26
    end
    new_ord.chr
  end
end
