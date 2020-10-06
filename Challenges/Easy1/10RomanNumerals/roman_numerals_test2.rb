require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'roman_numerals2'

class RomanNumeralsTest < Minitest::Test
  def test_not_a_string
    assert_raises(ArgumentError) { RomanNumerals.new(1) }
    assert_raises(ArgumentError) { RomanNumerals.new('IVCDP') }
  end
  
  def test_1
    assert_equal 1, RomanNumerals.to_integer('I')
  end

  def test_2
    assert_equal 2, RomanNumerals.to_integer('II')
  end

  def test_3
    assert_equal 3, RomanNumerals.to_integer('III')
  end

  def test_4
    assert_equal 4, RomanNumerals.to_integer('IV')
  end

  def test_5
    assert_equal 5, RomanNumerals.to_integer('V')
  end

  def test_6
    assert_equal 6, RomanNumerals.to_integer('VI')
  end

  def test_27
    assert_equal 27, RomanNumerals.to_integer('XXVII')
  end

  def test_48
    assert_equal 48, RomanNumerals.to_integer('XLVIII')
  end

  def test_59
    assert_equal 59, RomanNumerals.to_integer('LIX')
  end

  def test_93
    assert_equal 93, RomanNumerals.to_integer('XCIII')
  end

  def test_141
    assert_equal 141, RomanNumerals.to_integer('CXLI')
  end

  def test_163
    assert_equal 163, RomanNumerals.to_integer('CLXIII')
  end

  def test_402
    assert_equal 402, RomanNumerals.to_integer('CDII')
  end

  def test_575
    assert_equal 575, RomanNumerals.to_integer('DLXXV')
  end

  def test_911
    assert_equal 911, RomanNumerals.to_integer('CMXI')
  end

  def test_1024
    assert_equal 1024, RomanNumerals.to_integer('MXXIV')
  end

  def test_3000
    assert_equal 3000, RomanNumerals.to_integer('MMM')
  end


  # def test_4
  #   skip
  #   assert_equal 'IV', 4.to_roman
  # end

  # def test_5
  #   skip
  #   assert_equal 'V', 5.to_roman
  # end

  # def test_6
  #   skip
  #   assert_equal 'VI', 6.to_roman
  # end

  # def test_9
  #   skip
  #   assert_equal 'IX', 9.to_roman
  # end

  # def test_27
  #   skip
  #   assert_equal 'XXVII', 27.to_roman
  # end

  # def test_48
  #   skip
  #   assert_equal 'XLVIII', 48.to_roman
  # end

  # def test_59
  #   skip
  #   assert_equal 'LIX', 59.to_roman
  # end

  # def test_93
  #   skip
  #   assert_equal 'XCIII', 93.to_roman
  # end

  # def test_141
  #   skip
  #   assert_equal 'CXLI', 141.to_roman
  # end

  # def test_163
  #   skip
  #   assert_equal 'CLXIII', 163.to_roman
  # end

  # def test_402
  #   skip
  #   assert_equal 'CDII', 402.to_roman
  # end

  # def test_575
  #   skip
  #   assert_equal 'DLXXV', 575.to_roman
  # end

  # def test_911
  #   skip
  #   assert_equal 'CMXI', 911.to_roman
  # end

  # def test_1024
  #   skip
  #   assert_equal 'MXXIV', 1024.to_roman
  # end

  # def test_3000
  #   skip
  #   assert_equal 'MMM', 3000.to_roman
  # end
end
