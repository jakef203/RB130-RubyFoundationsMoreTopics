


def compare(word)
  puts "Output"
  puts "Before: #{word}"
  if block_given?
    puts "After: #{yield(word)}"
  else
    puts "After: #{word}"
  end
end

def compare1(str)
  puts "Before: #{str}"
  after = yield(str)
  # yield(str)
  puts "After: #{after}"
end

a_proc = Proc.new(&:upcase)

compare1("hello there")
puts ""
p a_proc
# compare("hello there", &a_proc) #{ |word| word.upcase }

