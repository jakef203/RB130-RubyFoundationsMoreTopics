
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!



class TypeTest < Minitest::Test 

  def test_exception
    value = Numeric.new
    assert_instance_of(Numeric, value)
  end
end