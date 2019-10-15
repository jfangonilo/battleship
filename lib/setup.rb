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

  def computer_place(ship)
    letters = ["A", "B", "C", "D"]
    numbers = ["1", "2", "3", "4"]
    coin_flip = rand(2)
    # require "pry"; binding.pry
    if coin_flip == 1
      valid_letter_combos = []
      letters.map.each_cons(ship.length) {|letter| valid_letter_combos << letter}
      # require "pry"; binding.pry
      letter_placement = valid_letter_combos.sample
      match = numbers.sample
      rtrn = letter_placement.map do |letter|
        letter + match
      end
      require "pry"; binding.pry
    else
      valid_number_combos = []
      numbers.map.each_cons(ship.length) {|number| valid_number_combos << number}
      # require "pry"; binding.pry
      number_placement = valid_number_combos.sample
      match = letters.sample
      rtrn = number_placement.map do |number|
        number.prepend(match)
      end
      require "pry"; binding.pry
    end
  end
end
