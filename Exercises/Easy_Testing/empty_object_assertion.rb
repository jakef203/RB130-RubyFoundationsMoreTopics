
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class EmptyTest < Minitest::Test 

  def test_empty
    list = []
    # assert_nil(list[0])
    assert_empty(list)
    # assert_equal(true, list.empty?)

  end
end