
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class List
  attr_reader :process
  def process
    self
  end
end


class SameTest < Minitest::Test 

  def test_same
    @list = List.new
    assert_same(@list, @list.process)
  end
end