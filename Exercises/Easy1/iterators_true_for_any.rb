
def any?(arr)

  arr.each do |element|
    return true if yield(element)
  end
  false

end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false

p any?((1..4)) { |value| value % 5 == 0 }

hsh = { a: 1, b: 3, c: 5 }
p any?(hsh) { |key, value| value % 5 == 0 }
