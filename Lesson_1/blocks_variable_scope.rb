

def call_me(some_code)
  some_code.call 
end
## You must initialize the variable name before using it in new proc
name = "Robert"  ## If this line isn't here you will get an error for undefined local variable 'name'
chunk_of_code = Proc.new { puts "hi #{name}" }
name = "Griffin"

call_me(chunk_of_code)  ## Outputs "Griffin"





# level_1 = "outer-most variable"

# [1, 2, 3].each do |n|                     # block creates a new scope
#   level_2 = "inner variable"
#   # puts level_1

#   ['a', 'b', 'c'].each do |n2|            # nested block creates a nested scope
#     level_3 = "inner-most variable"
#     puts "#{n} #{n2}"
#     puts level_1
#     puts level_2

#     # all three level_X variables are accessible here
#   end

#   # level_1 is accessible here
#   # level_2 is accessible here
#   # level_3 is not accessible here

# end





