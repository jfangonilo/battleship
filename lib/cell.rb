class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate, ship = nil)
    @coordinate = coordinate
    @ship = ship
  end

  def empty?
    return true if ship == nil
    false
  end

  def place_ship(ship)
    @ship = ship
  end
end
