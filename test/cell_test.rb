require './lib/ship'
require './lib/cell'
require 'minitest/pride'
require 'minitest/autorun'

class CellTest < Minitest::Test
  def setup
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C3")
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Cell, @cell_1
  end

  def test_it_has_a_coordinate
    assert_equal "B4", @cell_1.coordinate
  end

  def test_it_starts_without_ship
    refute @cell_1.ship
  end

  def test_empty_without_ship
    assert_equal true, @cell_1.empty?
  end

  def test_ship_can_be_placed
    @cell_1.place_ship(@cruiser)
    assert_instance_of Ship, @cell_1.ship
  end

  def test_cell_can_be_fired_on
     @cell_1.place_ship(@cruiser)
     assert_equal false, @cell_1.fired_upon

     @cell_1.fire_upon
     assert_equal true, @cell_1.fired_upon
  end

  def test_ship_can_be_damaged
    @cell_1.place_ship(@cruiser)
    assert_equal 3, @cell_1.ship.health

    @cell_1.fire_upon
    assert_equal 2, @cell_1.ship.health
  end

  def test_doesnt_break_if_cell_fired_upon_empty
    @cell_1.fire_upon
    assert_equal true, @cell_1.fired_upon
  end

  def test_render_cell_not_fired_upon
    assert_equal ".", @cell_1.render
  end

  def test_render_fired_upon_and_no_ship
    @cell_1.fire_upon
    assert_equal "M", @cell_1.render
  end

  def test_render_fired_upon_contains_ship
    @cell_1.place_ship(@cruiser)
    @cell_1.fire_upon
    assert_equal "H", @cell_1.render
  end

  def test_render_sunk
    assert_equal ".", @cell_1.render
    @cell_1.fire_upon
    assert_equal "M", @cell_1.render
    @cell_2.place_ship(@cruiser)
    assert_equal ".", @cell_2.render
    assert_equal "S", @cell_2.render(true)
    @cruiser.hit
    assert_equal false, @cruiser.sunk?
    @cruiser.hit
    @cruiser.hit
    assert_equal true, @cruiser.sunk?
    assert_equal "X", @cell_2.render
  end
end
