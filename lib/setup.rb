class Setup
  attr_reader :player_board, :computer_board

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @ships = {
      cruiser: Ship.new("Cruiser", 3),
      submarine: Ship.new("Submarine", 2)
    }
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

  def player_place
  puts "The enemy has deployed their ships!"
  puts "Deploy your ships now!"
  puts "Follow this format: A1 B1 C1"
  @player_board.render(true)
    @ships.each do |key, ship|
      puts "Enter squares for the #{ship.name} (#{ship.length} spaces)"
      coordinates = input
      until good_coordinates?(coordinates) && good_placement?(ship, coordinates)
        sleep 1.0
        puts "Invalid placement, please try again..."
        puts "Do not overlap placed ships and follow this format: A1 B1 C1"
        puts "#{ship.name}: #{ship.length} spaces"
        coordinates = input
      end
      @player_board.place(ship, coordinates)
      sleep 1.0
      puts "#{ship.name} placed!"
      @player_board.render(true)
      puts ""
    end
  end
end
