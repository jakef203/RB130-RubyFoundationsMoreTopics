
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class NilTest < Minitest::Test 

  def test_nil
    # value = nil
    arr = [1, 2, 3, 4]
    assert_nil(arr[2])
    # assert_equal(nil, arr[2]) ## this can also work
  end
end