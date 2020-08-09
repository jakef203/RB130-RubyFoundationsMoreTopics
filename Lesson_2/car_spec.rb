
require 'minitest/autorun'

require_relative 'car'

# class CarTest < Minitest::Test 
#   attr_reader :car
#   def setup
#     @car = Car.new 
#   end
describe 'Car#wheels' do 
  it 'has 4 wheels' do
    car = Car.new 
    car.wheels.must_equal 4 
  end
end