require './lib/board'
require './lib/ship'
require './lib/cell'
require 'minitest/pride'
require 'minitest/autorun'

class CellTest < Minitest::Test
  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_cells_in_a_hash
    assert_instance_of Hash, @board.cells
  end

  def test_it_has_16_cells
    assert_equal 16, @board.cells.count
  end

  def test_the_values_are_cells
    assert_instance_of Cell, @board.cells["A1"]
  end

  def test_cells_are_valid
    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal true, @board.valid_coordinate?("D4")
    assert_equal false, @board.valid_coordinate?("A5")
    assert_equal false, @board.valid_coordinate?("E1")
    assert_equal false, @board.valid_coordinate?("A22")
  end

  def test_coordinate_numbers_equals_ship_length
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
  end

  def test_if_placement_coordinates_are_consecutive
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "C1"])
    assert_equal true, @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
    assert_equal true, @board.valid_placement?(@submarine, ["C1", "B1"])
  end

  def test_ship_placement_coordinates_cant_be_diagonal
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
    assert_equal false, @board.valid_placement?(@submarine, ["C2", "D3"])
  end

  def test_ship_placement_is_valid
    assert_equal true, @board.valid_placement?(@submarine, ["A1", "A2"])
    assert_equal true, @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])
  end

  def test_range_of_letter_coordinates_given
    assert_equal 1, @board.letter_range(["A2", "A3"])
    assert_equal 2, @board.letter_range(["A2", "B1"])
    assert_equal 3, @board.letter_range(["A2", "B4", "C1", "C3"])
    assert_equal 4, @board.letter_range(["A2", "B4", "D1"])
  end

  def test_range_of_number_coordinates_given
    assert_equal 1, @board.number_range(["C3", "A3"])
    assert_equal 2, @board.number_range(["D3", "B4", "B3"])
    assert_equal 3, @board.number_range(["A2", "B1", "C1", "B3"])
    assert_equal 4, @board.number_range(["B4", "D1"])
  end

  def test_you_can_place_ship
    @board.place(@cruiser, ["A1", "A2", "A3"])
    assert_equal @cruiser, @board.cells["A1"].ship
    assert_equal @cruiser, @board.cells["A2"].ship
    assert_equal @cruiser, @board.cells["A3"].ship
  end
end
