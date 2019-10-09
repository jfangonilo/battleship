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
    refute @cell.ship
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

  def test_ship_can_be_damaged
    @cell.place_ship(@cruiser)
    assert_equal 3, @cell.ship.health

    @cell.fire_upon
    assert_equal 2, @cell.ship.health
  end

  def test_doesnt_break_if_cell_fired_upon_empty
    @cell.fire_upon
    assert_equal true, @cell.fired_upon
  end

  def test_render_cell_not_fired_upon
    assert_equal ".", @cell.render
  end

  def test_render_fired_upon_and_no_ship
    @cell.fire_upon
    assert_equal "M", @cell.render
  end

  def test_render_fired_upon_contains_ship
    @cell.place_ship(@cruiser)
    @cell.fire_upon
    assert_equal "H", @cell.render
  end

  def test_render_sunk
    @cell.place_ship(@cruiser)
    @cruiser.hit
    assert_equal false, @cruiser.sunk?
    @cruiser.hit
    # require "pry"; binding.pry
    @cruiser.hit
    # require "pry"; binding.pry
    assert_equal true, @cruiser.sunk?
    assert_equal "X", @cell.render
  end
end
