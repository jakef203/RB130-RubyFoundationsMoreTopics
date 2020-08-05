require 'stringio'
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test 

  # def setup
  #   cash_register = CashRegister.new(50)
  #   transaction = Transaction.new(5.50)
  # end

  def test_change
    register = CashRegister.new(50)
    transaction = Transaction.new(5.50)
    transaction.amount_paid = 7
    assert_equal(1.50, register.change(transaction))
  end

  def test_give_receipt 
    item_cost = 5.50
    register = CashRegister.new(50)
    transaction = Transaction.new(item_cost)

    assert_output("You've paid $#{item_cost}.\n") do
      register.give_receipt(transaction)
    end
  end

  def test_accept_money 
    register = CashRegister.new(50)
    transaction = Transaction.new(5.50)
    transaction.amount_paid = 7

    previous_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money
    assert_equal(previous_amount + 7, current_amount )
  end

  def test_start_transaction

  end

end