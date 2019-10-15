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

  def test_it_can_get_player_input
    skip
    assert_equal ["A3", "A2", "A1"], @setup.input
  end

  def test_it_can_validate_inputs
    skip
    assert_equal true, @setup.good_coordinates?(@setup.input)
  end

  def test_it_can_validate_placements
    skip
    assert_equal true, @setup.good_placement?(@cruiser, @setup.input)
  end
end
