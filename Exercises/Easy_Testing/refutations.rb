
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class RefutedTest < Minitest::Test 

  def test_included
    list = ['abc', '123']
    refute_includes(list, 'xyz')
    # assert_equal(true, list.include?('xyz')) # Does the same thing, first way is better though
  end
end