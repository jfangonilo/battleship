require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/setup'
require 'minitest/pride'
require 'minitest/autorun'

class SetupTest < Minitest::Test
  def setup
    @setup = Setup.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Setup, @setup
  end

  def test_it_has_a_computer_and_player_board
    assert_instance_of Board, @setup.computer_board
    assert_instance_of Board, @setup.player_board
  end

  def test_it_can_validate_inputs
    assert_equal true, @setup.good_coordinates?(["A1", "A4"])
    assert_equal false, @setup.good_coordinates?(["1B"])
    assert_equal false, @setup.good_coordinates?(["BA"])
    assert_equal false, @setup.good_coordinates?(["sgdkjbsd"])
    assert_equal false, @setup.good_coordinates?(["1"])
    assert_equal false, @setup.good_coordinates?(["B"])
  end

  def test_it_can_validate_placements
    assert_equal true, @setup.good_placement?(@submarine, ["A1", "B1"])
    assert_equal true, @setup.good_placement?(@submarine, ["C1", "B1"])
    assert_equal false, @setup.good_placement?(@submarine, ["A1", "B2"])
    assert_equal false, @setup.good_placement?(@submarine, ["A1", "A3"])
    assert_equal false, @setup.good_placement?(@submarine, ["A1"])
    assert_equal false, @setup.good_placement?(@submarine, ["sfhass"])
    assert_equal false, @setup.good_placement?(@submarine, ["1B", "1C"])
    assert_equal true, @setup.good_placement?(@cruiser, ["A1", "B1", "C1"])
    assert_equal true, @setup.good_placement?(@cruiser, ["B3", "B2", "B4"])
    assert_equal false, @setup.good_placement?(@cruiser, ["A1", "B2", "C3"])
    assert_equal false, @setup.good_placement?(@cruiser, ["A1", "A3", "A4"])
    assert_equal false, @setup.good_placement?(@cruiser, ["A1", "A2"])
    assert_equal false, @setup.good_placement?(@cruiser, ["sfhass"])
    assert_equal false, @setup.good_placement?(@cruiser, ["1B", "1C", "1A"])
  end

  def test_player_can_place
    skip
    @setup.player_place
  end

  def test_computer_decide
    skip
    @setup.computer_decide(@cruiser)
  end

  def test_vertical
    skip
    puts "\nAll sets should have like number coordinate"
    p @setup.vertical_placement(["A", "B", "C", "D"], ["1", "2", "3", "4"], @cruiser)
    p @setup.vertical_placement(["A", "B", "C", "D"], ["1", "2", "3", "4"], @cruiser)
    p @setup.vertical_placement(["A", "B", "C", "D"], ["1", "2", "3", "4"], @cruiser)
    p @setup.vertical_placement(["A", "B", "C", "D"], ["1", "2", "3", "4"], @submarine)
    p @setup.vertical_placement(["A", "B", "C", "D"], ["1", "2", "3", "4"], @submarine)
    p @setup.vertical_placement(["A", "B", "C", "D"], ["1", "2", "3", "4"], @submarine)
  end

  def test_horizontal
    skip
    puts "\nAll sets should have like letter coordinate"
    p @setup.horizontal_placement(["A", "B", "C", "D"], ["1", "2", "3", "4"], @cruiser)
    p @setup.horizontal_placement(["A", "B", "C", "D"], ["1", "2", "3", "4"], @cruiser)
    p @setup.horizontal_placement(["A", "B", "C", "D"], ["1", "2", "3", "4"], @cruiser)
    p @setup.horizontal_placement(["A", "B", "C", "D"], ["1", "2", "3", "4"], @submarine)
    p @setup.horizontal_placement(["A", "B", "C", "D"], ["1", "2", "3", "4"], @submarine)
    p @setup.horizontal_placement(["A", "B", "C", "D"], ["1", "2", "3", "4"], @submarine)
  end

  def test_computer_place
    skip
    @setup.computer_place(@cruiser)
    @setup.computer_board.render(true)
    @setup.computer_place(@submarine)
    @setup.computer_board.render(true)
  end

  def test_computer_place_all
    @setup.computer_place_all
    @setup.computer_board.render(true)
  end
end
