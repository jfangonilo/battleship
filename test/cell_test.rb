require './lib/ship'
require './lib/cell'
require 'minitest/pride'
require 'minitest/autorun'

class CellTest < Minitest::Test
  def setup
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

  def test_it_has_a_coordinate
    assert_equal "B4", @cell.coordinate
  end

  def test_it_starts_without_ship
    assert_equal nil, @cell.ship
  end

  def test_empty_without_ship
    assert_equal true, @cell.empty?
  end

  def test_ship_can_be_placed
    @cell.place_ship(@cruiser)
    assert_instance_of Ship, @cell.ship
  end

  def test_cell_can_be_fired_on
     @cell.place_ship(@cruiser)
     assert_equal false, @cell.fired_upon

     @cell.fire_upon
     assert_equal true, @cell.fired_upon
  end

end
