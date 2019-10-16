class Board
  attr_reader :cells

  def initialize
    @cells = {
      "A1" => Cell.new("A1"), "A2" => Cell.new("A2"), "A3" => Cell.new("A3"), "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"), "B2" => Cell.new("B2"), "B3" => Cell.new("B3"), "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"), "C2" => Cell.new("C2"), "C3" => Cell.new("C3"), "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"), "D2" => Cell.new("D2"), "D3" => Cell.new("D3"), "D4" => Cell.new("D4"),
    }
  end

  def render(visible = false)
    puts ""
    print "  1 2 3 4 \n" +
    "A #{cells["A1"].render(visible)} #{cells["A2"].render(visible)} #{cells["A3"].render(visible)} #{cells["A4"].render(visible)} \n" +
    "B #{cells["B1"].render(visible)} #{cells["B2"].render(visible)} #{cells["B3"].render(visible)} #{cells["B4"].render(visible)} \n" +
    "C #{cells["C1"].render(visible)} #{cells["C2"].render(visible)} #{cells["C3"].render(visible)} #{cells["C4"].render(visible)} \n" +
    "D #{cells["D1"].render(visible)} #{cells["D2"].render(visible)} #{cells["D3"].render(visible)} #{cells["D4"].render(visible)} \n"
  end

  def valid_coordinate?(coordinate)
    cells.key?(coordinate)
  end

  def coordinates_occupied?(coordinates)
    coordinates.any? {|coordinate| cells[coordinate].empty? == false}
  end

  def split(coordinate)
    coordinate.split('')
  end

  def get_range(array)
    (array.first..array.last).to_a.length
  end

  def sort_by_unique(array)
    array.uniq.sort
  end

  def extract_letters(coordinates)
    coordinates.map {|coordinate| split(coordinate).first}
  end

  def extract_numbers(coordinates)
    coordinates.map {|coordinate| split(coordinate).last}
  end

  def letter_range(coordinates)
    get_range(sort_by_unique(extract_letters(coordinates)))
  end

  def number_range(coordinates)
    get_range(sort_by_unique(extract_numbers(coordinates)))
  end

  def duplicates?(coordinates)
    coordinates.uniq.length != coordinates.length
  end

  def length_incorrect?(ship, coordinates)
    ship.length != coordinates.length
  end

  def diagonal?(coordinates)
    (letter_range(coordinates) > 1) && (number_range(coordinates) > 1)
  end

  def not_consecutive?(ship, coordinates)
    (letter_range(coordinates) > ship.length) || (number_range(coordinates) > ship.length)
  end

  def valid_placement?(ship, coordinates)
    return false if coordinates_occupied?(coordinates) ||
      duplicates?(coordinates) || length_incorrect?(ship, coordinates) ||
      diagonal?(coordinates) || not_consecutive?(ship, coordinates)
    true
  end

  def place(ship, coordinates)
    coordinates.each {|coordinate| cells[coordinate].place_ship(ship)}
  end

  def letter_dimensions
    sort_by_unique(@cells.keys.map {|coordinate| split(coordinate).first}.flatten)
  end

  def number_dimensions
    sort_by_unique(@cells.keys.map {|coordinate| split(coordinate).last}.flatten)
  end
end
