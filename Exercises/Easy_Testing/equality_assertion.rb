
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!


class EqualityTest < Minitest::Test 

  def test_xyz
    value = 'XYP'
    assert_equal('xyz', value.downcase)
  end
end