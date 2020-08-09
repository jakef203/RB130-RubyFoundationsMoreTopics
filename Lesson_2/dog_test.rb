
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'dog'

class DogTestClass < Minitest::Test 

  def test_legs
    dog = Dog.new
    assert_equal(4, dog.legs)
  end

  def test_bad_legs 
    skip
    dog = Dog.new 
    assert_equal(4, dog.legs)
  end
end