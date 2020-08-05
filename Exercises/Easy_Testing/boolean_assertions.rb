
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class OddTest < Minitest::Test
  def test_odd
    value = 20
    assert(value.odd?, 'value is not odd')
    assert_equal(true, value.odd?)  # This is used more often
  end
end
