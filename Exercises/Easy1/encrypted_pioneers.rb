# Make rot13 function, takes in a character, returns the letter for rot13 or the same character it's given

# For a given encrypted name, split it into name sections
# For each name in encrypted_name
#   Iterate over each character in name using each_char.to_a

#   Map the array of characters to new name using rot13 function
#   Join characters in name to get name section of full name
# Join name sections to get unencrypted name

def decrypt_char(encrypted_char)
  case encrypted_char
  when 'A'..'M', 'a'..'m' then (encrypted_char.ord + 13).chr 
  when 'N'..'Z', 'n'..'z' then (encrypted_char.ord - 13).chr 
  else                          encrypted_char
  end
end


def rot13(name)
  name.each_char.to_a.map! { |char| decrypt_char(char) }.join
end


encrypted_list = ["Nqn Ybirynpr", "Tenpr Ubccre", "Nqryr Tbyqfgvar", "Nyna Ghevat",
                  "Puneyrf Onoontr", "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv", "Wbua Ngnanfbss",
                  "Ybvf Unvog", "Pynhqr Funaaba", "Fgrir Wbof", "Ovyy Tngrf", "Gvz Orearef-Yrr",
                  "Fgrir Jbmavnx", "Xbaenq Mhfr", "Fve Nagbal Ubner", "Zneiva Zvafxl", "Lhxvuveb Zngfhzbgb",
                  "Unllvz Fybavzfxv", "Tregehqr Oynapu"]

encrypted_list.each { |name| puts rot13(name) }

# p decrypt_name2("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")

## Their solution
# ENCRYPTED_PIONEERS = [
#   'Nqn Ybirynpr',
#   'Tenpr Ubccre',
#   'Nqryr Tbyqfgvar',
#   'Nyna Ghevat',
#   'Puneyrf Onoontr',
#   'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
#   'Wbua Ngnanfbss',
#   'Ybvf Unvog',
#   'Pynhqr Funaaba',
#   'Fgrir Wbof',
#   'Ovyy Tngrf',
#   'Gvz Orearef-Yrr',
#   'Fgrir Jbmavnx',
#   'Xbaenq Mhfr',
#   'Fve Nagbal Ubner',
#   'Zneiva Zvafxl',
#   'Lhxvuveb Zngfhzbgb',
#   'Unllvz Fybavzfxv',
#   'Tregehqr Oynapu'
# ].freeze

# def rot13(encrypted_text)
#   encrypted_text.each_char.reduce('') do |result, encrypted_char|
#     result + decipher_character(encrypted_char)
#   end
# end

# def decipher_character(encrypted_char)
#   case encrypted_char
#   when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
#   when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
#   else                         encrypted_char
#   end
# end

# ENCRYPTED_PIONEERS.each do |encrypted_name|
#   puts rot13(encrypted_name)
# end

Ada Lovelace
Grace Hopper
Adele Goldstine
Alan Turing
Charles Babbage
Abdullah Muhammad bin Musa al-Khwarizmi
John Atanasoff
Lois Haibt
Claude Shannon
Steve Jobs
Bill Gates
Tim Berners-Lee
Steve Wozniak
Konrad Zuse
Sir Antony Hoare
Marvin Minsky
Yukihiro Matsumoto
Hayyim Slonimski
Gertrude Blanch


