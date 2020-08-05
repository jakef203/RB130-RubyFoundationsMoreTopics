require 'minitest/autorun'
class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end

  def ==(other) # without this method it will fail because it's not comparing names of car in assert_equal
    other.is_a?(Car) && name == other.name 
  end
end

class CarTest < MiniTest::Test
  def test_value_equality
    car1 = Car.new
    car2 = Car.new

    car1.name = "Kim"
    car2.name = "Kim"

    assert_equal(car1, car2)
    assert_same(car1, car2)
  end
end