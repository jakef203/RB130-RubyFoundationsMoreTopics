
def convert_to_base_8(n)
  n.to_s(8).to_i # replace these two method calls
end

# The correct type of argument must be used below
base8_proc = method(:convert_to_base_8).to_proc

## Writing the proc is also looks like this:
# base8_proc = Proc.new { |n| n.to_s(8).to_i }

# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object
arr = [8, 10, 12, 14, 16, 33].map(&base8_proc)
p arr

## Writing the proc is also looks like this:
base8_proc = Proc.new { |n| n.to_s(8).to_i }


# def say_hi
#   "hi"
# end

# new_proc = method(:say_hi).to_proc 

# mapped = [1, 2, 3, 4].map(&new_proc)

# p mapped

