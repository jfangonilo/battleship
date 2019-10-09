class Cell
  attr_reader :coordinate, :ship, :fired_upon

  def initialize(coordinate, ship = nil, fired_upon = false)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = fired_upon
  end

  def empty?
    return true if ship == nil
    false
  end

  def place_ship(ship)
    @ship = ship
  end

  def fire_upon
    @fired_upon = true
  end
end
