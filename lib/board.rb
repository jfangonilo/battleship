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

  def valid_placement?(ship, coordinates)
    if ship.length != coordinates.length
      false # test equals ship length
    elsif (letter_range(coordinates) > 1) && (number_range(coordinates) > 1)
      false # test for diagonal
    elsif letter_range(coordinates) > ship.length || number_range(coordinates) > ship.length
      false # test for consecutive
    else
      true
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
end
