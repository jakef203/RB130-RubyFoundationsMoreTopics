require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require_relative 'roman_numerals'

class RomanNumeralsTest < Minitest::Test
  def test_1
    skip
    assert_equal 'I', 1.to_roman
  end

  def test_1w
    assert_equal 'I', Roman.new(1).to_roman
  end

  def test_2
    skip
    assert_equal 'II', 2.to_roman
  end

  def test_2w
    
    assert_equal 'II', Roman.new(2).to_roman
  end

  def test_3
    skip
    assert_equal 'III', 3.to_roman
  end

  def test_3w
    assert_equal 'III', Roman.new(3).to_roman
  end

  def test_4
    skip
    assert_equal 'IV', 4.to_roman
  end

  def test_4w
    assert_equal 'IV', Roman.new(4).to_roman
  end

  def test_5
    skip
    assert_equal 'V', 5.to_roman
  end

  def test_5w
    assert_equal 'V', Roman.new(5).to_roman
  end

  def test_6
    skip
    assert_equal 'VI', 6.to_roman
  end

  def test_6w
    assert_equal 'VI', Roman.new(6).to_roman
  end

  def test_9
    skip
    assert_equal 'IX', 9.to_roman
  end

  def test_w
    assert_equal 'IX', Roman.new(9).to_roman
  end

  def test_27
    skip
    assert_equal 'XXVII', 27.to_roman
  end

  def test_27w
    assert_equal 'XXVII', Roman.new(27).to_roman
  end

  def test_48
    skip
    assert_equal 'XLVIII', 48.to_roman
  end

  def test_48w
    assert_equal 'XLVIII', Roman.new(48).to_roman
  end

  def test_59
    skip
    assert_equal 'LIX', 59.to_roman
  end

  def test_59w
    assert_equal 'LIX', Roman.new(59).to_roman
  end

  def test_93
    skip
    assert_equal 'XCIII', 93.to_roman
  end

  def test_93w
    assert_equal 'XCIII', Roman.new(93).to_roman
  end

  def test_141
    skip
    assert_equal 'CXLI', 141.to_roman
  end

  def test_141w
    assert_equal 'CXLI', Roman.new(141).to_roman
  end

  def test_163
    skip
    assert_equal 'CLXIII', 163.to_roman
  end

  def test_1w
    assert_equal 'CLXIII', Roman.new(163).to_roman
  end

  def test_402
    skip
    assert_equal 'CDII', 402.to_roman
  end

  def test_402w
    assert_equal 'CDII', Roman.new(402).to_roman
  end

  def test_575
    skip
    assert_equal 'DLXXV', 575.to_roman
  end

  def test_1w
    assert_equal 'DLXXV', Roman.new(575).to_roman
  end

  def test_911
    skip
    assert_equal 'CMXI', 911.to_roman
  end

  def test_911w
    assert_equal 'CMXI', Roman.new(911).to_roman
  end

  def test_1024
    skip
    assert_equal 'MXXIV', 1024.to_roman
  end

  def test_1024w
    assert_equal 'MXXIV', Roman.new(1024).to_roman
  end

  def test_3000
    skip
    assert_equal 'MMM', 3000.to_roman
  end

  def test_3000w
    assert_equal 'MMM', Roman.new(3000).to_roman
  end
end