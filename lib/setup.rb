class Setup
  attr_reader :player_board, :computer_board

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
  end

  def input
    gets.chomp.upcase.split(" ")
  end

  def good_coordinates?(coordinates)
    coordinates.each do |coordinate|
      return false if @player_board.valid_coordinate?(coordinate) == false
      return true
    end
  end

  def good_placement?(ship, coordinates)
    return false if good_coordinates?(coordinates) == false
    return @player_board.valid_placement?(ship, coordinates)
  end
end
