require './lib/ship'
require 'minitest/pride'
require 'minitest/autorun'

class ShipTest < Minitest::Test
  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Ship, @cruiser
  end
end
