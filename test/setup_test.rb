require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/setup'
require 'minitest/pride'
require 'minitest/autorun'

class SetupTest < Minitest::Test
  def setup
    @setup = Setup.new
  end

  def test_it_exists
    assert_instance_of Setup, @setup
  end

  def test_it_has_a_computer_and_player_board
    assert_instance_of Board, @setup.computer_board
    assert_instance_of Board, @setup.player_board
  end
end
