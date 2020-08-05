require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def miaow
    "#{name} is miaowing."
  end
end

class CatTest < MiniTest::Test
  def setup
    @kitty = Cat.new('Kitty')
  end

  def test_is_cat; end

  def test_name
    # assert_equal("Milo", @kitty.name) 
    # assert(@kitty.name == 'Milo')
    refute_equal('Kitty', @kitty.name)
  end

  def test_miaow; end

  def test_raises_error; end
end
