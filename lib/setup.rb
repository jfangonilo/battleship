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
    coordinates.all? {|coordinate| @player_board.valid_coordinate?(coordinate)}
  end

  def good_placement?(ship, coordinates)
    return false unless good_coordinates?(coordinates)
    @player_board.valid_placement?(ship, coordinates)
  end

  def player_place
  puts "The enemy has deployed their ships! \n" + "Deploy your ships now!\n" + "Follow this format: A1 B1 C1\n"
  @player_board.render(true)
    @ships.each do |key, ship|
      puts "Deploy the #{ship.name} (#{ship.length} units)"
      coordinates = input
      until good_placement?(ship, coordinates)
        sleep 1.0
        @player_board.render(true)
        puts "\nCannot deploy, please try again..." + "\nDo not overlap deployed ships and follow this format: A1 B1 C1"
        puts "#{ship.name}: #{ship.length} units\n"
        coordinates = input
      end
      @player_board.place(ship, coordinates)
      sleep 1.0
      puts "\n#{ship.name} deployed!"
      @player_board.render(true)
      puts ""
    end
  end

  def valid_consecutive(rows_and_columns, ship)
    valid = []
    rows_and_columns.each_cons(ship.length) {|row_or_column| valid << row_or_column}
    valid
  end

  def vertical_placement(letters, numbers, ship)
    number = numbers.sample
    (valid_consecutive(letters, ship).sample).map {|letter| letter + number}
  end

  def horizontal_placement(letters, numbers, ship)
    letter = letters.sample
    (valid_consecutive(numbers, ship).sample).map {|number| letter + number}
  end

  def computer_decide(ship)
    return vertical_placement(@computer_board.letter_dimensions, @computer_board.number_dimensions, ship) if rand(2) == 1
    horizontal_placement(@computer_board.letter_dimensions, @computer_board.number_dimensions, ship)
  end

  def computer_place(ship)
    place_attempt = computer_decide(ship)
    while @computer_board.coordinates_occupied?(place_attempt)
      place_attempt = computer_decide(ship)
    end
    @computer_board.place(ship, place_attempt)
  end

  def computer_place_all
    @ships.each {|key, ship| computer_place(ship)}
  end
end
