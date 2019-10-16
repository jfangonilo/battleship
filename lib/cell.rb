class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    return true if @ship == nil
    false
  end

  def place_ship(ship)
    @ship = ship
  end

  def fire_upon
    @fired_upon = true
    ship.hit unless empty?
  end

  def fired_upon?
    @fired_upon
  end

  def hit?
    !empty? && fired_upon?
  end

  def sunk?
    !empty? && ship.sunk?
  end

  def missed?
    empty? && fired_upon?
  end

  def render(ship_visible = false)
    return "X" if sunk?
    return "H" if hit?
    return "S" if !empty? && ship_visible
    return "M" if missed?
    "."
  end
end
