
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class KindTest < Minitest::Test 

  def test_kind 
    # value = Numeric.new
    # value = 10
    value = 23.3
    # value = 'hello'
    assert_kind_of(Numeric, value)
    # assert_equal(true, value.kind_of?(Numeric))
  end
end

#assert_kind_of uses Object#kind_of? to check if the class of its 
#second argument is an instance of the named class or one of the named class's subclasses.

