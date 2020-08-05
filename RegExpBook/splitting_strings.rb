text = %s("Hello there")
p text.match(/".*?"/)


## Capture groups

#   text.match(/(["'].*?\1) \1 is a backreference and will match whatever what is in ["']
#   text.match(/".*?"/) || text.match(/'.*?'/)
#   puts "Got a quoted string"
# end

##Transformations

text = "Four score and seven years"
vowelless = text.gsub(/[aeiou]/, '*')
sub_5letter = text.gsub(/\b\w{5}\b/, "*****")
p vowelless
p sub_5letter

text = %(We read 'War of the Worlds'.)
p text
puts text.sub(/(['"]).+\1/, '\1The Time Machine\1')
puts text.sub(/(['"]).+\1/, "\\1The Time Machine\\1")  # if you use double quotes you have to use double backslash