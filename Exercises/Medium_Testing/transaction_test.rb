require 'stringio'
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'transaction'

class TransactionTest < Minitest::Test 

  # Their solution
  def test_prompt_for_payment1 
    transaction = Transaction.new(30)
    input = StringIO.new('30')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal 30, transaction.amount_paid
  end

  ## I'm not sure how String IO is working with output, trying to make it like
  ## my solution below
  # def test_prompt_for_payment2 
  #   transaction = Transaction.new(30)
  #   input = StringIO.new('20\n40\n')
  #   output = StringIO.new
  #   transaction.prompt_for_payment(input: input, output: output)
  #   assert_equal 40, transaction.amount_paid
  # end

  ## My solution
  def test_prompt_for_payment2

    transaction = Transaction.new(30)
    input = StringIO.new("20\n40\n")

    expected_output = <<-OUTPUT.gsub /^\s+/, ""
    You owe $30.
    How much are you paying?
    That is not the correct amount. Please make sure to pay the full cost.
    You owe $30.
    How much are you paying?
    OUTPUT

    assert_output(expected_output) do
      transaction.prompt_for_payment(input: input)
    end

    assert_equal(40, transaction.amount_paid)
  end

end