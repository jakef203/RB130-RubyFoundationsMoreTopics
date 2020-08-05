

arr = (1..10).to_a

arr.each do |ea|
  p ea
  arr.shift if ea % 2 == 0
end

