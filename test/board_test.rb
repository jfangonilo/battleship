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
    skip
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "C1"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
    assert_equal false, @board.valid_placement?(@submarine, ["C1", "B1"])
  end

  def test_ship_placement_coordinates_cant_be_diagonal
    skip
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
    assert_equal false, @board.valid_placement?(@submarine, ["C2", "D3"])
  end

  def test_ship_placement_is_valid
    skip
    assert_equal true, @board.valid_placement?(@submarine, ["A1", "A2"])
    assert_equal true, @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])
  end

  def test_coordinate_letters
    assert_equal ["A"], @board.letter_set(["A2", "A3", "A4"])
    assert_equal ["A", "B", "D"], @board.letter_set(["D2", "A3", "B4"])
  end

  def test_coordinate_numbers
    assert_equal ["1"], @board.number_set(["D1", "A1", "C1"])
    assert_equal ["1", "2", "4"], @board.number_set(["A2", "B4", "B1"])
  end
end
