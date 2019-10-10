require './lib/board'
require './lib/ship'
require './lib/cell'
require 'minitest/pride'
require 'minitest/autorun'

class CellTest < Minitest::Test
  def setup
    @board = Board.new
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
end
