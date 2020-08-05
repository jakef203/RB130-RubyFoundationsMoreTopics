
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class IncludedTest < Minitest::Test 

  def test_included
    list = ['abc', '123', 'xyz']
    assert_includes(list, 'xyz')
    # assert_equal(true, list.include?('xyz')) # Does the same thing, first way is better though
  end
end