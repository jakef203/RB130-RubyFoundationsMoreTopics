
# str = 'cast'
# print "matched 's'" if str.match(/s/)
# print "matched 'x'" if str.match(/x/)

# puts 'matched 1' if 'Four score'.match(/\s/)
# puts 'matched 2' if "Four\tscore".match(/\s/)
# puts 'matched 3' if "Four-score\n".match(/\s/)
# puts 'matched 4' if "Four-score".match(/\s/)

# TEXT1 = "red fish\nblue fish\n"
# puts "matched red" if TEXT1.match(/^red/)
# puts "matched blue" if TEXT1.match(/^blue/)

# TEXT2 = "red fish\nred shirt"
# puts "matched fish" if TEXT2.match(/fish$/)
# puts "matched shirt" if TEXT2.match(/shirt$/)

text = "The lazy cat sleeps\nThe number 623 is not a cat\nThe Alaskan drives a snowcat"
ans = text.scan(/cat/)
p ans