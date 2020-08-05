
class Demo
  def initialize(name)
    @name = name 
  end

  def display_name
    puts "Hi, my name is #{@name}"
  end
end

one = Demo.new("Josh")
j_hi = one.method(:display_name)
j_hi

new1 = method(:puts)

