class Board
  attr_reader :cells

  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4"),
    }
  end

  def valid_coordinate?(coordinate)
    cells.key?(coordinate)
  end

  def coordinates_occupied?(coordinates)
    coordinates.any? do |coordinate|
      cells[coordinate].empty? == false
    end
  end

  # get sorted array of the unique letters in a set of coordinates
  # returns length of range from first and last numbers of said array
  def letter_range(coordinates)
    letter_array = coordinates.map do |coordinate|
      coordinate.split('').first
    end.uniq.sort
    return (letter_array.first..letter_array.last).to_a.length
  end

  # get sorted array of the unique numbers in a set of coordinates
  # returns length of range from first and last numbers of said array
  def number_range(coordinates)
    number_array = coordinates.map do |coordinate|
      coordinate.split('').last
    end.uniq.sort
    return (number_array.first..number_array.last).to_a.length
  end

  def valid_placement?(ship, coordinates)
    if coordinates_occupied?(coordinates)
      false # test if coordinates occupied
    elsif ship.length != coordinates.length
      false # test if coordinates length equals ship length
    elsif (letter_range(coordinates) > 1) && (number_range(coordinates) > 1)
      false # test if any coordinates are diagonal
    elsif (letter_range(coordinates) > ship.length) || (number_range(coordinates) > ship.length)
      false # test for consecutive coordinates
    else
      true
    end
  end

  def place(ship, coordinates)
    coordinates.each {|coordinate| cells[coordinate].place_ship(ship)}
  end

  def render
    # held = @cells.keys
    # print " 1 2 3 4  \n"
    # @cells.each do |coordinate, cell|
    #
    #   print " " + cell.render
    # end
    # require "pry"; binding.pry
  end

  def dimensions
    # gets x and y dimensions
    x = @cells.keys.map {|coordinate| coordinate.split('').first}.flatten.uniq.sort.length
    y = @cells.keys.map {|coordinate| coordinate.split('').last}.flatten.uniq.sort.length

    [x, y]
  end
end
