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

  def test_it_has_a_name
    assert_equal "Cruiser", @cruiser.name
  end

  def test_it_has_a_length
    assert_equal 3, @cruiser.length
  end

  def test_it_can_get_hit
    assert_equal 3, @cruiser.health
    @cruiser.hit
  end
end
