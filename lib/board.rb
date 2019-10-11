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

  def setup
    @first_cell = @cells.to_a.first(0)
    @last_cell = @cells.to_a.last(15)
    #@placement_coordinates = @first_cell.first..@last_cell.last).to_a
    @placement_coordinates = Range.new(@first_cell..@last_cell)
    @cell_numbers = Range.new(1..4).to_a
    @cell_letters = Range.new("A".."D".ord).to_a
  end

  def valid_coordinate?(coordinate)
    cells.key?(coordinate)
  end

  def valid_placement?(ship, placement_coordinates)
    case
    when @cell_numbers || @cell_letters
      true
    when placement_coordinates.each_cons(ship.length) { |cell| }
      true
    else
      false
    end
  end

end
